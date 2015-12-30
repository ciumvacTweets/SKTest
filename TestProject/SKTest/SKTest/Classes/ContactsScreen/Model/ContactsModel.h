//
//  ContactsModel.h
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ContactsModel : NSObject

-(NSArray *)getContactsWichNameMatches:(NSString *)text;

@end
