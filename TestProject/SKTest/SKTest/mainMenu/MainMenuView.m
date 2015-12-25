//
//  MainMenuView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "MainMenuView.h"
#import "MainMenuViewController.h"

@interface MainMenuView ()

@property (weak, nonatomic) IBOutlet UIImageView *backgoundImageView;

@end

@implementation MainMenuView



- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"This feature is not ready" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
    
    [alertController addAction:dismiss];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
