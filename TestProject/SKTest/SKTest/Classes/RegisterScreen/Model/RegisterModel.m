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
    
    NSMutableArray *_validatedFieldsArray;
}
@end

@implementation RegisterModel

-(instancetype)init {
    
    if (!self) {
        self = [super init];
    }
    
    [self arrayInitialize];
    
    return self ;
}


-(void)arrayInitialize {
    
    _validatedFieldsArray = [[NSMutableArray alloc] initWithObjects:@0, @0, @0, @0, @0, @0, @0, nil];
    
}

-(void)setFirstName:(NSString *)firstName validated:(BOOL)validated {
    
   validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:0]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:0];

    _firstName = firstName;
    
}
-(void)setLastName:(NSString *)lastName validated:(BOOL)validated{
    
     validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:1]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:1];
    
    _lastName  = lastName;
    
}

-(void)setEmail:(NSString *)email validated:(BOOL)validated{
    
     validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:2]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:2];
    
    _email = email;
}

-(void)setVerifiedEmail:(NSString *)verifiedEmail validated:(BOOL)validated {
    
     validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:3]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:3];
    
    _verifiedEmail = verifiedEmail;
}
-(void)setPassword:(NSString *)password validated:(BOOL)validated {
   
    validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:4]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:4];
    
    _password = password;
    
    
}

-(void)setVerifiedPassword:(NSString *)verifiedPassword validated:(BOOL)validated {
    
     validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:5]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:5];
    
    _verifiedPassword = verifiedPassword;
}

-(void)setBirthDateString:(NSString *)birthDateString validated:(BOOL)validated{
    
    validated ? [_validatedFieldsArray setObject:@1 atIndexedSubscript:6]:[_validatedFieldsArray setObject:@0 atIndexedSubscript:6];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MMM' 'dd','yyyy"];
    
    _birthDate = [dateFormatter dateFromString:birthDateString];
    NSLog(@"date:%@", _birthDate);
}

-(NSUInteger)validatedLabelsNumber {
    _fieldsNumber = 0;
    
    for (NSNumber *number in _validatedFieldsArray ) {
        _fieldsNumber += [number integerValue];
    }
    
    NSLog(@"%lu", (unsigned long)_fieldsNumber);
    
    return _fieldsNumber;
}
@end
