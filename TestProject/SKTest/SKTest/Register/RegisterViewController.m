//
//  RegisterViewController.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterHandler.h"
#import "RegisterView.h"
@interface RegisterViewController () <RegisterViewDelegate>

@property (strong, nonatomic) RegisterHandler *handler;
@property (readonly) RegisterView *registerView;
@end

@implementation RegisterViewController

-(instancetype)initWithHandler:(RegisterHandler *)handler {
    
    self = [super initWithNibName:@"RegisterView" bundle:nil];
    
    
    if (self) {
        
        _handler = handler;
    }
    
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.registerView.delegate = self;
    
    // Do any additional setup after loading the view.
}

-(void)popView {
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(RegisterView *)registerView {
    
    return (RegisterView *)self.view;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
