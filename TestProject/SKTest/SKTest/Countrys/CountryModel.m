//
//  CountryModel.m
//  SKTest
//
//  Created by vitorio ciumac on 12/28/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "CountryModel.h"
#import "CountryAPI.h"
@interface CountryModel () <CountryAPIDelegate>
{
    
    NSArray *_countriesArray;
    NSArray *_countriesNamesArray;
}

@end

@implementation CountryModel

-(instancetype)init {
    
    if (!self) {
        
        self = [super init];
    }
    
    return self;
}




-(NSArray *)countriesNamesArray {
    
    if (_countriesNamesArray.count > 0 ) {
        
        return _countriesNamesArray;
    }
    
    return nil;
}

-(void)receiveCountryList:(NSArray *)countyList {
    
    
}
-(void)requestFailedWithError:(NSString *)errorString {
    
    
}
@end
