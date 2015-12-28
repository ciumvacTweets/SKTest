//
//  RegisterView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "RegisterView.h"
#import "SKCustomTextfield.h"

@interface RegisterView () <UITextFieldDelegate>
{
    SKCustomTextfield *_currentTextfield;

    
}
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *firstNameTextField;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *lastNameTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *emailTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *emailConfirmationTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *passwordTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *passwordConfirmationTextfield;



@end

@implementation RegisterView


- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self setTextFieldDelegates];
   
    
}

-(void)setTextFieldDelegates  {
    
    self.firstNameTextField.delegate = self;
    self.lastNameTextfield.delegate  = self;
    self.emailTextfield.delegate     = self;
    self.emailConfirmationTextfield.delegate = self;
    self.passwordTextfield.delegate  = self;
    self.passwordConfirmationTextfield.delegate = self;
  
}

-(void)resignResponderSelector {
    if (!_currentTextfield) { // for once calling
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(outsideTouch)];
    
        [self addGestureRecognizer:tap];
    }
}

-(void)outsideTouch {
    [_currentTextfield resignFirstResponder];
    
}


- (void)textFieldDidBeginEditing:(SKCustomTextfield *)textField
{
  

    [self resignResponderSelector];
    
    _currentTextfield = textField; // careful! this should be after selector
    
    [self srollToTopBy:textField.tag];
    
    
    
}

-(void)srollToTopBy:(NSUInteger)tag {
    
    [_scrollView setContentOffset:CGPointMake(0, 50*tag) animated:YES];
}

-(void)resetScrollView {
    
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
-(void)textFieldDidEndEditing:(SKCustomTextfield *)textField {
    
    if (textField.text.length > 0) {
        
         [_delegate textFieldDidEndEditingWithString:textField.text  andTag:textField.tag];
    
    } else {
        
 
    }
    
    [self resetScrollView];
    
   
    
}

-(void)setValidTextfield:(BOOL)isValidated withTag:(NSUInteger)tag {
    
    CGFloat borderWidth = isValidated ? 0 : 1;
    
    switch (tag) {
            
        case 0:{
            
            [_firstNameTextField.layer setBorderWidth:borderWidth];
            
            break;
        }
        case 1:{
            
            [_lastNameTextfield.layer setBorderWidth:borderWidth];
            
            break;
        }
        case 2:{
            
            [_emailTextfield.layer setBorderWidth:borderWidth];
            
            break;
        }
        case 3:{
            
            [_emailConfirmationTextfield.layer setBorderWidth:borderWidth];
            
            break;
        }
        case 4: {
            
            [_passwordTextfield.layer setBorderWidth:borderWidth];
            
            break;
        }
        case 5: {
            
            [_passwordConfirmationTextfield.layer setBorderWidth:borderWidth];
            
        }
        default:
            break;
    }

}


- (IBAction)onBackButtonTap:(id)sender {
    
    [self.delegate popView];
   
}


@end
