//
//  SKCustomTextfield.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "SKCustomTextfield.h"

@interface SKCustomTextfield () <UITextFieldDelegate>

@end


@implementation SKCustomTextfield



- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self customizeView];
    
    
    
}

-(void)customizeView {
    
    UIView *topBorder = [[UIView alloc] initWithFrame:CGRectMake(2, 0, self.frame.size.width-4, 1.5)];
    
    topBorder.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    [self addSubview:topBorder];
    self.layer.cornerRadius = 2;
    
    self.backgroundColor = [UIColor whiteColor] ;
}


@end
