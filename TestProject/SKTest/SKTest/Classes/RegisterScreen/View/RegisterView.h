//
//  RegisterView.h
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@protocol RegisterViewDelegate <NSObject>


-(void)popView;

-(void)textFieldDidEndEditingWithString:(NSString *)text andTag:(NSUInteger)tag;
-(void)showAlert:(UIAlertController *)alertController;

@end



@interface RegisterView : UIView

@property (weak, nonatomic) id<RegisterViewDelegate> delegate;

-(void)setValidTextfield:(BOOL)isValidated withTag:(NSUInteger)tag validatedFieldsNumber:(NSUInteger)fieldsNumber;

@end

