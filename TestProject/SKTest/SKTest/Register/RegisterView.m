//
//  RegisterView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView () <UITextFieldDelegate>


@end

@implementation RegisterView


//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//
//   
//    
//}

- (IBAction)onBackButtonTap:(id)sender {
    
    [self.delegate popView];
}


@end
