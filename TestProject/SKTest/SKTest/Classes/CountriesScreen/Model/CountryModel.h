//
//  CountryModel.h
//  SKTest
//
//  Created by vitorio ciumac on 12/28/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CountryModelDelegate <NSObject>

-(void)didReceiveIndexedCountryList:(NSDictionary *)indexedCountryList;
-(void)didFailWithError:(NSString *)errorString;



@end



@interface CountryModel : NSObject


@property (weak, nonatomic) id<CountryModelDelegate> delegate;


-(instancetype)init;
-(void)requestCountryList;

@end
