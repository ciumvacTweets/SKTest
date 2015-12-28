//
//  MainMenuView.m
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "MainMenuView.h"


@interface MainMenuView ()


@end

@implementation MainMenuView



- (UIAlertController *)showAlert {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"This feature is not ready" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
    
    [alertController addAction:dismiss];
    
    return alertController;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}


- (IBAction)registerTap:(id)sender {
    
    [_delegate pushToController:1];
    
}

- (IBAction)countryTap:(id)sender {
    
  //  [_delegate showAlert:[self showAlert]];
    
    [_delegate pushToController:2];
    
}

- (IBAction)contactsTap:(id)sender {
    
     [_delegate showAlert:[self showAlert]];
    
//     [_delegate pushToController:3];
    
}
@end
