//
//  RegisterView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "RegisterView.h"
#import "SKCustomTextfield.h"
#import "SKBorderedButton.h"
#import "ParallaxBackgroundView.h"

@interface RegisterView () <UITextFieldDelegate>
{
    SKCustomTextfield *_currentTextfield;
    NSUInteger _validatedTextFields;
    NSDate *_date;

    
}
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *firstNameTextField;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *lastNameTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *emailTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *emailConfirmationTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *passwordTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *passwordConfirmationTextfield;
@property (weak, nonatomic) IBOutlet SKCustomTextfield *birthDateTextfield;
@property (weak, nonatomic) IBOutlet SKBorderedButton *nextButton;

@property (weak, nonatomic) IBOutlet ParallaxBackgroundView *backgroundImageView;


@end

@implementation RegisterView

#pragma mark -- Initialization --

- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self setTextFieldDelegates];
    _validatedTextFields = 0;
    [_backgroundImageView addMotion];
    [_nextButton setEnabled:NO];
   
    
}

-(void)setTextFieldDelegates  {
    
    self.firstNameTextField.delegate = self;
    self.lastNameTextfield.delegate  = self;
    self.emailTextfield.delegate     = self;
    self.emailConfirmationTextfield.delegate = self;
    self.passwordTextfield.delegate  = self;
    self.passwordConfirmationTextfield.delegate = self;
    self.birthDateTextfield.delegate = self;
  
}

#pragma mark -- TextfieldDelegate --

- (void)textFieldDidBeginEditing:(SKCustomTextfield *)textField
{
    
    [textField addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
    
    [self resignResponderSelector];
    
    _currentTextfield = textField; // careful! this should be after selector
    
    if (textField.tag == 6) {
        
        [self initDatePicker];
    }
    
    
    [self srollToTopBy:textField.tag];
    
    
}

-(void)textFieldDidChange:(SKCustomTextfield *)textField {
    
    [_delegate textFieldDidEndEditingWithString:textField.text  andTag:textField.tag];
    
}

-(void)textFieldDidEndEditing:(SKCustomTextfield *)textField {
    
    [_delegate textFieldDidEndEditingWithString:textField.text  andTag:textField.tag];
    [self resetScrollView];
    
}

#pragma  mark -- Instance methods --


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




-(void)initDatePicker{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(setBirthDate:) forControlEvents:UIControlEventValueChanged];
    [_birthDateTextfield setInputView:datePicker];
}

-(void) setBirthDate:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)sender;
    [_birthDateTextfield setText:[self formatDate:picker.date]];
}


- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"MMM' 'dd','yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

-(void)srollToTopBy:(NSUInteger)tag {
    
    [_scrollView setContentOffset:CGPointMake(0, 50*tag) animated:YES];
}

-(void)resetScrollView {
    
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}


-(void)setValidTextfield:(BOOL)isValidated withTag:(NSUInteger)tag validatedFieldsNumber:(NSUInteger)fieldsNumber {
    
    struct CGColor *borderColor = isValidated ? [[UIColor greenColor] CGColor] : [[UIColor redColor] CGColor];
    
    [self setNextButtonStatus:fieldsNumber];
    
    switch (tag) {
            
        case 0:{
            
            [_firstNameTextField.layer setBorderColor:borderColor];
            
            break;
        }
        case 1:{
            
            [_lastNameTextfield.layer setBorderColor:borderColor];
            
            break;
        }
        case 2:{
            
            [_emailTextfield.layer setBorderColor:borderColor];
            
            break;
        }
        case 3:{
            
            [_emailConfirmationTextfield.layer setBorderColor:borderColor];
            
            break;
        }
        case 4: {
            
            [_passwordTextfield.layer setBorderColor:borderColor];
            
            break;
        }
        case 5: {
            
            [_passwordConfirmationTextfield.layer setBorderColor:borderColor];
            
            break;
            
        }
        case 6: {
            
            [_birthDateTextfield.layer setBorderColor:borderColor];
            
            if (!isValidated) {
               [_delegate showAlert:[self showAlertwithTitle:@"Sorry" message:@"you should have over 13 years for using this app"]];
            }
            break;
        }
        default:
            break;
    }

}

-(void)setNextButtonStatus:(NSUInteger)fieldsNumber {
    
    fieldsNumber > 6 ? [_nextButton setEnabled:YES] :[_nextButton setEnabled:NO];
}


- (UIAlertController *)showAlertwithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
    
    [alertController addAction:dismiss];
    
    return alertController;
    
}

#pragma  mark -- Button actions --

- (IBAction)onBackButtonTap:(id)sender {
    
    [self.delegate popView];
   
}

-(IBAction)onNextTap:(id)sender {
    
    [self resetScrollView];
    [_delegate showAlert:[self showAlertwithTitle:@"Well done" message:@"let's do another thing"]];
}

@end
