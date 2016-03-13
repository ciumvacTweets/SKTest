//
//  ContactsView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "ContactsView.h"
#import "ContactsCell.h"
@interface ContactsView () <UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate>
{
    NSArray *_contactsArray;
    NSUInteger _selectedContactsNumber;
    
}

@property (weak, nonatomic) IBOutlet UIView      *topBarView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton    *doneButton;
@property (weak, nonatomic) IBOutlet UITableView *contactsTableVIew;




- (IBAction)onBackTap:(id)sender;

@end

@implementation ContactsView



#pragma mark -- Initialization --



-(void)setupView {
    
    self.topBarView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.15];
    
    _selectedContactsNumber = 0;
    [self setupTableView];
    [self setupSearchBarView];
    
    [self doneButtonEnabled:NO];
}

-(void)setupTableView {
    
    self.contactsTableVIew.backgroundColor = [UIColor clearColor];
    self.contactsTableVIew.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
 //   self.contactsTableVIew.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.contactsTableVIew.separatorColor = [UIColor clearColor];
    [self.contactsTableVIew registerNib:[UINib nibWithNibName:@"ContactsCell"
                                                       bundle:nil]
                 forCellReuseIdentifier:@"ContactsCell"];
    
    self.contactsTableVIew.dataSource = self;
    self.contactsTableVIew.delegate = self;
    
}


-(void)setupSearchBarView{
    
    self.searchBar.delegate = self;
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.placeholder = @"search";
    self.searchBar.tintColor = [UIColor blackColor];
    self.searchBar.barTintColor = [UIColor whiteColor];


    
}


-(void)doneButtonEnabled:(BOOL)enabled {
    
    if (enabled) {
        
        [self.doneButton setEnabled:YES];
        [self.doneButton     setAlpha:1];
        
    } else {
        
        [self.doneButton setEnabled:NO];
        [self.doneButton  setAlpha:0.5];
    }
    
  
}

-(void)loadContacts:(NSArray *)contactsArray {
    
    _contactsArray = contactsArray;
    
    [self.contactsTableVIew reloadData];
}

#pragma mark -- searchBar delegate --

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [_delegate searchText:searchText];

}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    // You can write search code Here
}
#pragma mark --TableView Datasource --

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_contactsArray.count == 0) {
        return 1;
    }
    return _contactsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (_contactsArray.count != 0) {
        
        ContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCell"];
        
        if (!cell) {
            cell = [[ContactsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactsCell"];
        }
        
        NSDictionary *person = [_contactsArray objectAtIndex:indexPath.row];
        [cell setData:person];
        [cell.checkButton addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
    }
    
    UITableViewCell *cell1 = [[UITableViewCell alloc] init];
    
    cell1.backgroundColor = [UIColor colorWithWhite:1 alpha:0.08];
    cell1.textLabel.text = @"no contacts found";
    cell1.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell1;
}

-(void)select:(UIButton *)sender {
    
    if (sender.tag == 0) {
       
        [sender setTag:1];
        [sender setBackgroundImage:[UIImage imageNamed:@"Check-128"] forState:UIControlStateNormal];
        _selectedContactsNumber ++;
        [self doneButtonEnabled:YES];
    } else {
        sender.tag = 0;
        [sender setBackgroundImage:[UIImage imageNamed:@"Check-128unchecked"] forState:UIControlStateNormal];
        
        if (--_selectedContactsNumber == 0)
        {
            [self doneButtonEnabled:NO];
        }
    }
}

#pragma mark -- Button actions --
- (IBAction)onBackTap:(id)sender {
    
    [_delegate popView];
}
@end
