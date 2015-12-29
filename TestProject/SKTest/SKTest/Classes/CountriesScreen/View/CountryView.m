//
//  CountryView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/28/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "CountryView.h"
#import "CountryModel.h"


@interface CountryView () <UITableViewDataSource>
{
    NSArray *_sectionTitles;
    NSDictionary *_IndexedCountryList;
}

@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@property (strong, nonatomic) NSDictionary *countriesDictionary;


@end


@implementation CountryView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self viewSetup];
    self.countriesTableView.dataSource = self;

}

-(void)viewSetup {
    
    [self.countriesTableView setBackgroundColor:[UIColor clearColor]];
    self.countriesTableView.tableFooterView  =[[UIView alloc] initWithFrame:CGRectZero];
    
   
 
    
 
}

-(void)receiveIndexedCountryList:(NSDictionary *)IndexedCountryList{
    
    
    
    _sectionTitles = [[IndexedCountryList allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    _IndexedCountryList = IndexedCountryList;
    [self dispatchLater:^{
        [self.countriesTableView reloadData];
    }];
    
   
}


-(void)showError:(NSString *)errorString {
    
    
    [_delegate ShowAlert:[self showAlertwithTitle:@"Oops!" message:errorString]];
    
}

- (void)dispatchLater:(dispatch_block_t)block {
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), block);
}

- (UIAlertController *)showAlertwithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
    
    [alertController addAction:dismiss];
    
    return alertController;
    
}

#pragma mark -- TableViewDataSource --

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_sectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_sectionTitles objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *sectionTitle = [_sectionTitles objectAtIndex:section];
    NSArray *sectionCountries = [_IndexedCountryList objectForKey:sectionTitle];
    
    return [sectionCountries count];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    NSString *sectionTitle = [_sectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionCountries = [_IndexedCountryList objectForKey:sectionTitle];
    NSString *country = [sectionCountries objectAtIndex:indexPath.row];
    cell.textLabel.text = country;
    cell.backgroundColor = [UIColor clearColor];
    cell.userInteractionEnabled = NO;
    
    return cell; // delete when implement
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionTitles;
}

- (IBAction)onCancelTap:(id)sender {
    
    [_delegate popView];
}


@end
