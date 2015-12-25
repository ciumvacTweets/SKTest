//
//  MainMenuView.h
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainMenuViewDelegate <NSObject>

@property (weak, nonatomic) id<MainMenuViewDelegate> delegate;

@end

@interface MainMenuView : UIView


@end
