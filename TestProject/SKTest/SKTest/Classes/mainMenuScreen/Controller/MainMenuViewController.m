//
//  MainMenuViewController.m
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuView.h"

#import "RegisterHandler.h"
#import "RegisterViewController.h"

#import "CountryViewController.h"
#import "CountryModel.h"

#import "ContactsModel.h"
#import "ContactsViewController.h"

#import "HomeScreenViewController.h"

@interface MainMenuViewController () <MainMenuViewDelegate>

@property (readonly) MainMenuView *mainMenuView;
@end

@implementation MainMenuViewController

-(instancetype)init {
    
   self = [super initWithNibName:@"MainMenuView" bundle:nil];
    
    return self;
    
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.mainMenuView.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


-(MainMenuView *)mainMenuView {
    
    return (MainMenuView *)self.view;
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAlert:(UIAlertController *)alertController {
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)pushToController:(NSInteger )tag {
    
    switch (tag) {
        case 0: {
            
                    [self.navigationController pushViewController:[self homeViewController] animated:YES];
                    break;
                }
            
        case 1: {
            
                    [self.navigationController pushViewController:[self registerViewController]
                                                         animated:YES];
                    break;
                }
        
        case 2: {
                    [self.navigationController pushViewController:[self countryViewController]
                                                         animated:YES];
                    break;
                }
            
        case 3: {
                    [self.navigationController pushViewController:[self contactsViewController]
                                                         animated:YES];
                    break;
                }
        default:
            break;
    }
}



-(RegisterViewController *)registerViewController {
    
    RegisterHandler *registerHandler = [[RegisterHandler alloc] init];
    
    return [[RegisterViewController alloc] initWithHandler:registerHandler];
}


-(CountryViewController *)countryViewController {
    
    CountryModel *model = [[CountryModel alloc] init];
    
    return [[CountryViewController alloc] initWithModel:model];
}

-(ContactsViewController *)contactsViewController {
    
    ContactsModel *model = [[ContactsModel alloc] init];
    
    return [[ContactsViewController alloc] initWithModel:model];
}

-(HomeScreenViewController *)homeViewController {
    
    return [[HomeScreenViewController alloc] init];
}

@end
