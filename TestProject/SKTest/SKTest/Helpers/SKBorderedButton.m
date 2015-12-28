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
}

@end


@implementation SKBorderedButton




-(void)addBorders {
    
    UIView *topBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1.5)];
    
    topBorder.backgroundColor = [UIColor whiteColor];
    
    UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2,  self.frame.size.width, 1.5)];
    bottomBorder.backgroundColor = [UIColor whiteColor];
    
    [self setAlpha:0.8];
    [self addSubview:topBorder];
    [self addSubview:bottomBorder];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self addBorders];
    // Drawing code
}


@end
