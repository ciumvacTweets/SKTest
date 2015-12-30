//
//  RegisterModel.h
//  SKTest
//
//  Created by vitorio ciumac on 12/27/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterModel : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *verifiedEmail;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *verifiedPassword;
@property (strong, nonatomic) NSDate *birthDate;


-(instancetype)init;
-(NSUInteger)validatedLabelsNumber;

-(void)setFirstName:(NSString *)firstName validated:(BOOL)validated;
-(void)setLastName:(NSString *)lastName validated:(BOOL)validated;
-(void)setEmail:(NSString *)email validated:(BOOL)validated;
-(void)setVerifiedEmail:(NSString *)verifiedEmail validated:(BOOL)validated;
-(void)setPassword:(NSString *)password validated:(BOOL)validated;
-(void)setVerifiedPassword:(NSString *)verifiedPassword validated:(BOOL)validated;
-(void)setBirthDateString:(NSString *)birthDateString validated:(BOOL)validated;

@end
