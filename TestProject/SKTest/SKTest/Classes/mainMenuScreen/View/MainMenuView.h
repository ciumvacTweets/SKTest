//
//  MainMenuView.h
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParallaxBackgroundView.h"

@protocol MainMenuViewDelegate <NSObject>

-(void)showAlert:(UIAlertController *)alertController;
-(void)pushToController:(NSInteger)tag;

@end



@interface MainMenuView : UIView


@property (weak, nonatomic) id<MainMenuViewDelegate> delegate;

- (IBAction)registerTap:(id)sender;
- (IBAction)countryTap:(id)sender;
- (IBAction)contactsTap:(id)sender;
@end
