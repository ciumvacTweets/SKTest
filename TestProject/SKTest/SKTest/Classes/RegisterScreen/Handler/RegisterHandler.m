//
//  RegisterHandler.m
//  SKTest
//
//  Created by vitorio ciumac on 12/26/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "RegisterHandler.h"
#import "SKCustomTextfield.h"
@interface RegisterHandler ()
{
    
}
@end

@implementation RegisterHandler



-(void)validateText:(NSString *)text forSenderTag:(NSUInteger)tag
           response:(void (^)(BOOL))validated {
    

    switch (tag) {
            
        case 0:{
            
            validated([self validateName:text ]);
          
            break;
        }
        case 1:{
            
            validated([self validateName:text ]);
            
            break;
        }
        case 2:{
            
            validated([self validateEmail:text]);
            
            break;
        }
        case 3:{
            
            validated([self validateEmail:text]);
            
            break;
        }
        case 4: {
            
            validated ([self validatePassword:text]);
            
            break;
        }
        case 5: {
            
            validated ([self validatePassword:text]);
            break;
        }
        case 6: {
            validated ([self validateBirthDate:text]);
            break;
        }
        default:
            break;
    }
    

}

-(BOOL)validateName:(NSString*)text
{
    
    
        
        
        NSString *nameFormat = @"^(?=.{3,})[a-zA-Z]+$"; //regex for 3+ Alphabetical characters
        
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameFormat];
        
        return [nameTest evaluateWithObject:text];

}


-(BOOL)validateEmail:(NSString *)text {
    
    
    NSString *emailFormatRegex = @"[A-Z0-9a-z\\._-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailFormatRegex];
    
    
    return [emailTest evaluateWithObject:text];
        
      
        
    
}

-(BOOL)validatePassword:(NSString *)text {
    
    

        NSString *validRegex = @"^(?=.{8,})(?=.*[0-9])(?=.*[a-zA-Z])([@#$%^&=a-zA-Z0-9_-]+)$"; // regex for string with at least 1 char + 1 digit + some special characters
        NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegex];
        
        return [passwordTest evaluateWithObject:text];
}

-(BOOL)validateBirthDate:(NSString*)text {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"MMM' 'dd','yyyy"];
 

    NSDate *birthDate = [dateFormatter dateFromString:text];
    
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:birthDate
                                       toDate:now
                                       options:0];
   
    return [ageComponents year] >12 ? YES : NO ;
}

@end
