//
//  SKCustomButton.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "SKBorderedButton.h"

@interface SKBorderedButton ()
{
    NSString *_buttonTitle;
    UIView *_topBorder;
    UIView *_bottomBorder;
}

@end


@implementation SKBorderedButton




-(void)addBorders {
    
    _topBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1.5)];
    
    _topBorder.backgroundColor = [UIColor whiteColor];
    
    _bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2,  self.frame.size.width, 1.5)];
    _bottomBorder.backgroundColor = [UIColor whiteColor];
    
    [self setAlpha:0.8];
    [self addSubview:_topBorder];
    [self addSubview:_bottomBorder];
    
}


- (void) setEnabled:(BOOL)enabled {
    
    [super setEnabled:enabled];
   
    if (enabled) {
        [self setTitleColor:[UIColor colorWithWhite:1 alpha:0.9] forState:UIControlStateNormal];
    } else {
        [self setTitleColor:[UIColor colorWithWhite:1 alpha:0.4] forState:UIControlStateDisabled];
    }
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self addBorders];
    // Drawing code
}


@end
