//
//  HomeScreenViewController.m
//  SKTest
//
//  Created by vitorio ciumac on 1/9/16.
//  Copyright © 2016 vitorio ciumac. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "HomeScreenView.h"

@interface HomeScreenViewController () <HomeScreenViewDelegate>

@property (readonly) HomeScreenView *homeView;

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeView.delegate = self;
    // Do any additional setup after loading the view.
}


-(HomeScreenView *)homeView {
    
    return (HomeScreenView *)self.view; 
}

#pragma mark -- View delegate --

-(void)showAlert:(UIAlertController *)alert {
    
        [self.navigationController presentViewController:alert animated:YES completion:nil];
}


#pragma mark  -- Memory Management --

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
