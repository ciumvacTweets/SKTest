//
//  RegisterModel.h
//  SKTest
//
//  Created by vitorio ciumac on 12/27/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterModel : NSObject

@property (weak, nonatomic) NSString *firstName;
@property (weak, nonatomic) NSString *lastName;
@property (weak, nonatomic) NSString *email;
@property (weak, nonatomic) NSString *verifiedEmail;
@property (weak, nonatomic) NSString *password;
@property (weak, nonatomic) NSString *verifiedPassword;
@property (weak, nonatomic) NSDate *birthDate;


-(instancetype)init;

-(NSInteger)fieldsSetted;
@end
