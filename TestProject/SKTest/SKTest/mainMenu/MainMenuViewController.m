//
//  MainMenuViewController.m
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuView.h"
#import "MainMenuHandler.h"
#import "RegisterHandler.h"
#import "RegisterViewController.h"

@interface MainMenuViewController () <MainMenuViewDelegate>


@property (strong, nonatomic) MainMenuHandler *handler;
@property (readonly) MainMenuView *mainMenuView;
@end

@implementation MainMenuViewController

-(instancetype)initWithHandler:(MainMenuHandler *)handler {
    
   self = [super initWithNibName:@"MainMenuView" bundle:nil];
    
    
    if (self) {
        
        _handler = handler;
    }
    
    return self;
    
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.mainMenuView.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
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
            
        case 1: {
            
                    [self.navigationController pushViewController:[self registerViewController]
                                                         animated:YES];
                    break;
                }
        
        case 2: {
            
                    break;
                }
            
        case 3: {
            
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
@end
