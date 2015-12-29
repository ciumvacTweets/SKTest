//
//  CountryAPI.h
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CountryAPIDelegate <NSObject>

// returns received categories array
- (void) receiveCountryList:(NSArray *)countryList;

// handle connection errors
- (void) requestFailedWithError:(NSString *)errorString;

@end

@interface CountryAPI : NSObject 

@property (weak, nonatomic) id<CountryAPIDelegate> delegate;


-(void)requestCountryList;

@end
