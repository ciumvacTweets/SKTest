//
//  CountryView.h
//  SKTest
//
//  Created by vitorio ciumac on 12/28/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CountryViewDelegate <NSObject>

-(void)popView;
-(void)ShowAlert:(UIAlertController *)alert;

@end

@interface CountryView : UIView

-(void)receiveIndexedCountryList:(NSDictionary *)IndexedCountryList;
-(void)showError:(NSString *)errorString;

@property (weak, nonatomic) id<CountryViewDelegate>delegate;

@end
