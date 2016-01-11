//
//  HomeScreenView.m
//  SKTest
//
//  Created by vitorio ciumac on 1/9/16.
//  Copyright © 2016 vitorio ciumac. All rights reserved.
//

#import "HomeScreenView.h"
#import "ParallaxBackgroundView.h"
@interface HomeScreenView ()

@property (weak, nonatomic) IBOutlet ParallaxBackgroundView *backgroundImageView;

@end

@implementation HomeScreenView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [_backgroundImageView addMotion];
    // Drawing code
}


@end
