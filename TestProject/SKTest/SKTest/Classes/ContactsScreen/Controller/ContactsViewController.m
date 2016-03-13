//
//  ContactsViewController.m
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactsModel.h"
#import "ContactsView.h"
@interface ContactsViewController () <ContactsViewDelegate>
{
    ContactsModel *_model;
}

@property (readonly) ContactsView *contactsView;
@end



@implementation ContactsViewController

-(instancetype)initWithModel:(ContactsModel *) model {
    
    if (!self) {
        self = [super initWithNibName:@"ContactsView" bundle:nil];
    }
    
    _model = model;
    
    return  self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.contactsView.delegate = self;
    [self.contactsView setupView];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.contactsView loadContacts:[_model getContactsWichNameMatches:nil]];
}
# pragma mark -- view delegate --

-(void)popView {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)searchText:(NSString *)text {
    
    [self.contactsView loadContacts:[_model getContactsWichNameMatches:text]];
}

-(ContactsView *)contactsView {
    
    return (ContactsView *)self.view;
}

#pragma  mark -- memory management --
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
