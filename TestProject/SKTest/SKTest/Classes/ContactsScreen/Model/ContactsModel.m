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
    BOOL _completed;
}

@end

@implementation ContactsModel


-(instancetype)init {
    
    if (!self) {
        
        self = [super init];
    }
    
   // [self getPersonOutOfAddressBook];
    [self retrieveContactsWithCompletionBlock:^(id complete) {
        
         _completed= YES;
    }];
    return self;
}


    

-(void)retrieveContactsWithCompletionBlock:(void (^)(id))completionBlock {
    

    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted)
                completionBlock([self retrieveContactsforBook:addressBookRef]);
            
        });
    }
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        
        completionBlock([self retrieveContactsforBook:addressBookRef]);
    }

    
    else {
        // Send an alert telling user to change privacy setting in settings app
        completionBlock(@"YES");
    }
    
    CFRelease(addressBookRef);
    
    
}

-(NSString *)retrieveContactsforBook:(ABAddressBookRef)adresBook {
    
    
    CFErrorRef *error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
    CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
    
    NSMutableArray *contactsArray = [[NSMutableArray alloc] init];
    
    
    for(int i = 0; i < numberOfPeople; i++) {
        
        ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
        
        NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        
        
        NSMutableString *fullName = [[NSMutableString alloc] init];
        if (firstName.length >0) {
            [fullName appendString:firstName];
        }
        if (lastName.length > 0) {
            [fullName appendString:[NSString stringWithFormat:@" %@",lastName]];
        }
        ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
        
        NSString *phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
        
        
        
        BOOL hasImage = ABPersonHasImageData(person);
        
        NSMutableDictionary *contact = [[NSMutableDictionary alloc] initWithCapacity:5];
        
        [contact setValue:firstName forKey:@"firstName"];
        [contact setValue:lastName forKey:@"lastName"];
        [contact setValue:fullName forKey:@"fullName"];
        [contact setValue:phoneNumber forKey:@"phone"];
        [contact setValue:[NSNumber numberWithBool:hasImage] forKey:@"hasImage"];
        
        
        NSData  *data = (__bridge_transfer NSData*) ABPersonCopyImageDataWithFormat(person, 0);
        
        
        if (hasImage){
            
            UIImage *image = [UIImage imageWithData:data];
            [contact setValue:image forKey:@"image"];
        }
        
        [contactsArray addObject:contact];
        
        if (firstName) {
            CFRelease((__bridge CFTypeRef)(firstName));
        }
        if (lastName) {
            CFRelease((__bridge CFTypeRef)(lastName));
        }
        
        CFRelease(phoneNumbers);
        
        
    }
    
    CFRelease(allPeople);
    CFRelease(addressBook);
    
    
    
    _contactsArray = contactsArray;
    
    
   return @"YES";

}


-(NSString *)appendString:(NSString *)firstName andString:(NSString *)lastName {
   
    NSMutableString *fullName;
    
    
    
    return fullName;
}


-(NSArray *)getContactsWichNameMatches:(NSString *)text {

    
  
        NSMutableArray *filtredContactsArray = [[NSMutableArray alloc] init];
        if (text.length == 0) {
            
            return _contactsArray;
            
        }
        
        NSDictionary *person = [[NSDictionary alloc] init];
        for (person in _contactsArray ) {
            
            if ([[person valueForKey:@"fullName"] rangeOfString:text options:NSCaseInsensitiveSearch].location != NSNotFound) {
                
                [filtredContactsArray addObject:person];
                
            }}
    
    
    
    
        return filtredContactsArray;
   
}
@end

