//
//  RegisterHandler.h
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SKCustomTextfield;


@interface RegisterHandler : NSObject


-(void)validateText:(NSString *)text forSenderTag:(NSUInteger)tag
           response:(void (^)(BOOL))validated;


@end
