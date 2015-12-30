//
//  ContactsModel.m
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "ContactsModel.h"
#import <AddressBook/AddressBook.h>
#import <UIKit/UIKit.h>
@interface ContactsModel () {
    
    NSArray *_contactsArray;
}

@end

@implementation ContactsModel


-(instancetype)init {
    
    if (!self) {
        
        self = [super init];
    }
    
   // [self getPersonOutOfAddressBook];
    [self retrieveContacts];
    return self;
}


-(void)retrieveContacts {
    

    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            
        });
    }
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        
        CFErrorRef *error = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
        
        NSMutableArray *contactsArray = [[NSMutableArray alloc] init];
        
        
        for(int i = 0; i < numberOfPeople; i++) {
            
            ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
            
            NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
            NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
            NSLog(@"Name:%@ %@", firstName, lastName);
            
            NSMutableString *fullName = [[NSMutableString alloc] init];
            if (firstName.length >0) {
                [fullName appendString:firstName];
            }
            if (lastName.length > 0) {
                [fullName appendString:[NSString stringWithFormat:@" %@",lastName]];
            }
            ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);

            NSString *phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, 0);

            NSLog(@"%@", phoneNumber);
            
         
            BOOL hasImage = ABPersonHasImageData(person);
            
            NSMutableDictionary *contact = [[NSMutableDictionary alloc] initWithCapacity:5];
            
            [contact setValue:firstName forKey:@"firstName"];
            [contact setValue:lastName forKey:@"lastName"];
            [contact setValue:fullName forKey:@"fullName"];
            [contact setValue:phoneNumber forKey:@"phone"];
            [contact setValue:[NSNumber numberWithBool:hasImage] forKey:@"hasImage"];
            
            CFRelease((__bridge CFTypeRef)(firstName));
            CFRelease((__bridge CFTypeRef)(lastName));
            
            NSData  *data = (__bridge_transfer NSData*) ABPersonCopyImageDataWithFormat(person, 0);

            
            if (hasImage){
                
                UIImage *image = [UIImage imageWithData:data];
                [contact setValue:image forKey:@"image"];
            }
            
            [contactsArray addObject:contact];
            
             CFRelease(phoneNumbers);
//            CFRelease(person);
            
        }
        CFRelease(numberOfPeople);
        CFRelease(allPeople);
        CFRelease(addressBook);
        
        
        
        _contactsArray = contactsArray;
    }
    else {
        // Send an alert telling user to change privacy setting in settings app
    }
    
    CFRelease(addressBookRef);
    
    
}


-(NSString *)appendString:(NSString *)firstName andString:(NSString *)lastName {
   
    NSMutableString *fullName;
    
    
    
    return fullName;
}


-(NSArray *)getContactsWichNameMatches:(NSString *)text {
    
    
    if (text.length == 0) {
        return _contactsArray;
        
    }
    
    NSMutableArray *filtredContactsArray = [[NSMutableArray alloc] init];
    NSDictionary *person = [[NSDictionary alloc] init];
    for (person in _contactsArray ) {

        if ([[person valueForKey:@"fullName"] rangeOfString:text options:NSCaseInsensitiveSearch].location != NSNotFound) {
        
            [filtredContactsArray addObject:person];
        
        }
    }
    
    return filtredContactsArray;
}
@end

