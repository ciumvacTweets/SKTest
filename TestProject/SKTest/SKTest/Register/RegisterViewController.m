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
#import "RegisterModel.h"
@interface RegisterViewController () <RegisterViewDelegate>

@property (strong, nonatomic) RegisterHandler *handler;
@property (readonly) RegisterView *registerView;
@property (strong, nonatomic) RegisterModel *model;

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
    
    _model = [[RegisterModel alloc] init];
    
    // Do any additional setup after loading the view.
}

-(RegisterView *)registerView {
    
    return (RegisterView *)self.view;
    
}

#pragma  mark -- View Delegate --

-(void)popView {
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)textFieldDidEndEditingWithString:(NSString *)text andTag:(NSUInteger)tag{
    
    [_handler validateText:text forSenderTag:tag
                  response:^(BOOL isValid) {
                      
                      switch (tag) {
                              
                          case 0:{
                              
                              if (isValid) {
                                  
                                  [_model setFirstName:text];
                              }
                            
                              [self.registerView setValidTextfield:isValid withTag:tag];
                                  
                              
                              break;
                          }
                          case 1:{
                              
                              if (isValid) {
                                  
                                  [_model setLastName:text];
                                  
                              }
                              
                              [self.registerView setValidTextfield:isValid withTag:tag];
                              
                              break;
                          }
                          case 2:{
                              
                              if (isValid) {
                                  
                                  [_model setEmail:text];
                              }
                              
                              [self.registerView setValidTextfield:isValid withTag:tag];
                              
                              break;
                          }
                          case 3:{
                              
                              if ([text isEqualToString:_model.email] && isValid ) {
                                  
                                  [_model setVerifiedEmail:text];
                              [self.registerView setValidTextfield:isValid withTag:tag];
                                  
                              } else {
                              [self.registerView setValidTextfield:NO withTag:tag];
                              }
                              
                              break;
                          }
                          case 4: {
                              if (isValid) {
                                  
                                  [_model setPassword:text];
                              }
                              
                              [self.registerView setValidTextfield:isValid withTag:tag];
                              
                              break;
                          }
                          case 5: {
                              
                              if ([text isEqualToString:_model.password ] && isValid) {
                                  
                                  [_model setVerifiedPassword:text];
                                  [self.registerView setValidTextfield:isValid withTag:tag];
                                  
                              }else {
                              
                              [self.registerView setValidTextfield:NO withTag:tag];
                              }
                              break;
                          }
                              
                          default:
                              break;
                      }

                    }];
    
}


#pragma mark -- memory management --

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
