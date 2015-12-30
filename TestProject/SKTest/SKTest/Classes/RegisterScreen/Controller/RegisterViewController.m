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
    
    self.model = [[RegisterModel alloc] init];
    
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

                                  
                                  [_model setFirstName:text validated:isValid];
                              
                            
                              [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                                  
                              
                              break;
                          }
                          case 1:{
                              
                                  
                                  [_model setLastName:text validated:isValid];
                                  
                              
                              
                             [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                              
                              break;
                          }
                          case 2:{
                              
                                  [_model setEmail:text validated:isValid];
                              
                              
                              [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                              
                              break;
                          }
                          case 3:{
                              
                                [_model setVerifiedEmail:text validated:isValid];
                              
                              if ([text isEqualToString:_model.email]  ) {
                                  
                              [_model setVerifiedEmail:text validated:isValid];
                              [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                                  
                              } else {
                                  [_model setVerifiedEmail:text validated:NO];
                                  [self.registerView setValidTextfield:NO withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                              }
                              
                              break;
                          }
                          case 4: {
                                  
                                  [_model setPassword:text validated:isValid];
                              
                              
                              [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                              
                              break;
                          }
                          case 5: {
                              
                              if ([text isEqualToString:_model.password ]) {
                                  
                                  [_model setVerifiedPassword:text validated:isValid];
                                  [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                                  
                              }else {
                              [_model setVerifiedPassword:text validated:NO];
                              [self.registerView setValidTextfield:NO withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                              }
                              break;
                          }
                        
                          case 6: {
                              
                              
                                  [_model setBirthDateString:text validated:isValid];
                              
                              
                              [self.registerView setValidTextfield:isValid withTag:tag validatedFieldsNumber:_model.validatedLabelsNumber];
                              break;
                          }
                              
                          default:
                              break;
                      }

                    }];
    
}

-(void)showAlert:(UIAlertController *)alertController {
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark -- memory management --

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
