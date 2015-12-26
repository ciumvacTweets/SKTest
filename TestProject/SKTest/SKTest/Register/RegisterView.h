//
//  RegisterView.h
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@protocol RegisterViewDelegate <NSObject>


-(void)popView;

@end



@interface RegisterView : UIView


@property (weak, nonatomic) id<RegisterViewDelegate> delegate;
@end
