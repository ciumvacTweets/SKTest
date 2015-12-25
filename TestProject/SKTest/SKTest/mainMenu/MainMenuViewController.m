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

@interface MainMenuViewController ()


@property (strong, nonatomic) MainMenuHandler *handler;

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


@end
