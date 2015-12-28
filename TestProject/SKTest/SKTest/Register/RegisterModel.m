//
//  RegisterModel.m
//  SKTest
//
//  Created by vitorio ciumac on 12/27/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "RegisterModel.h"
@interface RegisterModel ()
{
    NSInteger _settedFields;
}
@end

@implementation RegisterModel

-(instancetype)init {
    
    if (!self) {
        self = [super init];
    }
    
    _settedFields = 0;
    return self ;
}


-(void)setFirstName:(NSString *)firstName {
    
    _firstName = firstName;
    _settedFields++;
}

-(void)setLastName:(NSString *)lastName {
    
    _lastName = lastName;
    _settedFields++;
}

-(void)setVerifiedEmail:(NSString *)verifiedEmail {
    
    _verifiedEmail = verifiedEmail;
    _settedFields++;
}

-(void)setVerifiedPassword:(NSString *)verifiedPassword {
    
    _verifiedPassword = verifiedPassword;
    _settedFields++;
}

-(void)setBirthDate:(NSDate *)birthDate {
    
    _birthDate = birthDate;
    _settedFields++;
}

-(NSInteger)fieldsSetted {
    
    return _settedFields;
}

@end
