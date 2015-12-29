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

    NSMutableArray *_countriesNamesArray;
}

@end

@implementation CountryModel

-(instancetype)init {
    
    if (!self) {
        
        self = [super init];
    }
    
    return self;
}

-(void)requestCountryList {
    
    CountryAPI *apiManager =[[CountryAPI alloc] init];
    apiManager.delegate = self;
    [apiManager requestCountryList];
}

-(void)getCountriesNames:(NSArray *)countryList {
    
    if (!_countriesNamesArray) {
        
        _countriesNamesArray = [[NSMutableArray alloc] init];
    }
    
    NSDictionary *country = [[NSDictionary alloc] init];
    NSString *countryName;
    
    for (country in countryList) {
        
        countryName = [country objectForKey:@"country"];
        
        [_countriesNamesArray addObject:countryName];
    }
    
    
    [self getLetterIndexes];
}

-(void)getLetterIndexes {
 
//    NSArray *lettersArray = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", "S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];

    // ne nifiga. nu la mine in cod //
    
    NSMutableDictionary *countriesWithIndexes = [[NSMutableDictionary alloc] init];
    NSString *country;
    NSString *letter;
    NSMutableArray *indexedCountriesArray = [[NSMutableArray alloc] init];
    
    for (country in _countriesNamesArray)
    {
        letter = [country substringToIndex:1];
        
        if ([countriesWithIndexes objectForKey:letter]) {
            
            indexedCountriesArray = [countriesWithIndexes objectForKey:letter];
            [indexedCountriesArray addObject:country];
            [countriesWithIndexes setValue:indexedCountriesArray forKey:letter];
        
        } else {
            
            [indexedCountriesArray removeAllObjects];
            [indexedCountriesArray addObject:country];
            [countriesWithIndexes setValue:indexedCountriesArray forKey:letter];
            
            
        }
        
    }
    
    [_delegate didReceiveIndexedCountryList:countriesWithIndexes];
}


#pragma mark -- API Delegate --
-(void)receiveCountryList:(NSArray *)countryList {
    
    [self getCountriesNames:countryList];
    
}

-(void)requestFailedWithError:(NSString *)errorString {
    
    NSLog(@"%@", errorString);
    [_delegate didFailWithError:errorString];
}
@end
