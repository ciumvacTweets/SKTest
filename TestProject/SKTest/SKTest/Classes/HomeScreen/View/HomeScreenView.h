//
//  HomeScreenView.h
//  SKTest
//
//  Created by vitorio ciumac on 1/9/16.
//  Copyright © 2016 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeScreenViewDelegate <NSObject>

-(void)showAlert:(UIAlertController *)alert;


@end

@interface HomeScreenView : UIView


@property (weak, nonatomic) id <HomeScreenViewDelegate> delegate;

@end
