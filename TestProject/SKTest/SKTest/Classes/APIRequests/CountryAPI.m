//
//  CountryAPI.m
//  SKTest
//
//  Created by vitorio ciumac on 12/24/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "CountryAPI.h"


@implementation CountryAPI

-(void)requestCountryList
{
    NSURL *requestURL = [NSURL URLWithString:@"https://dev.skeegleapp.com/api/v1/country-codes"];
    
    NSURLSessionDataTask *apiTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL
                                                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                    
                                        if (!error) {
                                            
                                            [self validateResultData:data];
                                            
                                        }else {
                                                                        
                                            [_delegate requestFailedWithError:[NSString stringWithFormat:@"%@", error.localizedDescription]];
                                        }
                                                        
                                        }];
    
    [apiTask resume];
}


-(void)validateResultData:(NSData *)data
{
    
    NSError *JsonError = nil;
    
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JsonError];
    
    if (JsonError) {
    
        NSLog(@"serialization error, %@", JsonError.localizedDescription);
        [_delegate requestFailedWithError:JsonError.localizedDescription];
    
    }else {
    
        [self validateDictionary:responseDictionary];
    }

}


-(void)validateDictionary:(NSDictionary*)responseDictionary
{
    BOOL isError = [[responseDictionary objectForKey:@"error"] boolValue];
    
    if (isError) {
        
        [_delegate requestFailedWithError:@"Wrong Data format" ];
    
    } else {
        
        NSArray *countryList = [responseDictionary objectForKey:@"content"];
        
        [_delegate receiveCountryList:countryList];
    }
}

@end
