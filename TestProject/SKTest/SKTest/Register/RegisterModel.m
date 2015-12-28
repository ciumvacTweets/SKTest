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
    NSUInteger _fieldsNumber;
}
@end

@implementation RegisterModel

-(instancetype)init {
    
    if (!self) {
        self = [super init];
    }
    

    return self ;
}

-(void)setFirstName:(NSString *)firstName {
    
    if (!_firstName) {
        _fieldsNumber ++;
    }
    
    _firstName = firstName;
    
}
-(void)setLastName:(NSString *)lastName{
    
    if (!_lastName) {
        _fieldsNumber ++;
    }
    
    _lastName  = lastName;
    
}

-(void)setEmail:(NSString *)email {
    if (!_email) {
        _fieldsNumber ++;
    }
    _email = email;
}

-(void)setVerifiedEmail:(NSString *)verifiedEmail {
    
    if (!_verifiedEmail) {
        _fieldsNumber ++;
    }
    _verifiedEmail = verifiedEmail;
}
-(void)setPassword:(NSString *)password {
    if (!_password) {
        _fieldsNumber++;
    }
    _password = password;
    
    
}

-(void)setVerifiedPassword:(NSString *)verifiedPassword {
    
    if (!_verifiedPassword) {
        _fieldsNumber++;
    }
    _verifiedPassword = verifiedPassword;
}

-(void)setBirthDateString:(NSString *)birthDateString{
    if(!_birthDate) {
        _fieldsNumber++;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MMM' 'dd','yyyy"];
    
    _birthDate = [dateFormatter dateFromString:birthDateString];
    NSLog(@"date:%@", _birthDate);
}

-(NSUInteger)validatedLabelsNumber {
    
    return _fieldsNumber;
}
@end
