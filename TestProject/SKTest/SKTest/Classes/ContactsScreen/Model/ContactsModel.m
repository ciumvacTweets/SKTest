//
//  ContactsModel.m
//  SKTest
//
//  Created by vitorio ciumac on 12/29/15.
//  Copyright © 2015 vitorio ciumac. All rights reserved.
//

#import "ContactsModel.h"
#import <AddressBook/AddressBook.h>

@interface ContactsModel () {
    
    NSArray *_contactsArray;
}

@end

@implementation ContactsModel


-(instancetype)init {
    
    if (!self) {
        
        self = [super init];
    }
    
    [self getPersonOutOfAddressBook];
    
    return self;
}

- (void)getPersonOutOfAddressBook
{
    
    CFErrorRef error = NULL;
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    
    if (addressBook) {
        NSLog(@"Succesful.");
        
        NSMutableArray *contactsArray = [[NSMutableArray alloc] init];
        
        NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
        
       
         for (int i = 0; i < [allContacts count]; i++)
            {
            
            [contactsArray addObject:[self getPersonInfoforArray:allContacts objectAtIndex:i]];
            
            }
        
        NSLog(@"allContactsList: %@", contactsArray);
        
        _contactsArray = contactsArray;
    
        CFRelease(addressBook);
        
    } else { 
    
        NSLog(@"Error reading Address Book");
    } 
}



-(NSDictionary *)getPersonInfoforArray:(NSArray *) allContacts objectAtIndex:(NSUInteger)i {
    
    NSMutableDictionary *person = [[NSMutableDictionary alloc] init];
    
    ABRecordRef contactPerson = (__bridge ABRecordRef)allContacts[i];
    
    
    NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson,
                                                                          kABPersonFirstNameProperty);
    NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(contactPerson, kABPersonLastNameProperty);
    
    NSString *phoneNumber;
    
    ABMultiValueRef phones = ABRecordCopyValue(contactPerson, kABPersonPhoneProperty);
    
    CFStringRef phoneNumberRef = ABMultiValueCopyValueAtIndex(phones, 0);
    
    
    phoneNumber = (__bridge NSString *)phoneNumberRef;
 
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    [person setObject:firstName forKey:@"firstName"];
    [person setObject:lastName forKey:@"lastName"];
    [person setObject:fullName forKey:@"fullName"];
    [person setObject:phoneNumber forKey:@"phone"];
    
    CFRelease(phoneNumberRef);
    CFRelease(phones);
    
    return person;

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
