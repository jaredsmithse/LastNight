//
//  AddressBookWrapper.m
//  LastNight
//
//  Created by Patrick Reynolds on 7/12/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

#import "AddressBookWrapper.h"
#import <UIKit/UIKit.h>

@implementation AddressBookWrapper

//- (id)initWithAddressBook: (ABAddressBookRef *)addressBook
//{
//    self = [super init];
//    if(self) {
//        _addressBook = addressBook;
//    }
//    return self;
//}

//- (NSArray *)contacts
//{
//    if (!_contacts) {
//        _contacts = self.getContacts;
//    }
//    
//    return _contacts;
//}

+(NSArray *)getContactsForSearchType: (NSString *)type
{
    NSMutableArray* info = [[NSMutableArray alloc] init];
    
    NSLog(@"Called!!");
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted){
        NSLog(@"Denied");
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
    {
        NSLog(@"Authorized");
        CFErrorRef *error = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
        
        if ( 'Date' )
        {
            NSString *dateString = [[NSString alloc] init];
            
            for(int i = 0; i < numberOfPeople; i++)
            {
                ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
                ABMultiValueRef dates = ABRecordCopyValue(person, kABPersonCreationDateProperty);
                
                for (CFIndex i = 0; i < ABMultiValueGetCount(dates); i++)
                {
                    NSString *date = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(dates, i);
                    
                    [info addObject: [dateString stringByAppendingFormat: @":%@",date]];
                    // NSLog(@"Addressbook Date: %@", date);
                }
            }
            
            return [NSArray arrayWithArray:info];
        } else if ( 'Company' )
        {
            NSString *companyString = [[NSString alloc] init];
            
            for(int i = 0; i < numberOfPeople; i++)
            {
                ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
                ABMultiValueRef companies = ABRecordCopyValue(person, kABPersonOrganizationProperty);
                
                for (CFIndex i = 0; i < ABMultiValueGetCount(companies); i++)
                {
                    NSString *company = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(companies, i);
                    
                    [info addObject: [companyString stringByAppendingFormat: @":%@",company]];
                    // NSLog(@"Addressbook Company: %@", company);
                }
            }
            
            return [NSArray arrayWithArray:info];
        } else if ( 'Job' )
        {
            NSString *jobString = [[NSString alloc] init];
            
            for(int i = 0; i < numberOfPeople; i++)
            {
                ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
                ABMultiValueRef jobs = ABRecordCopyValue(person, kABPersonJobTitleProperty);
                
                for (CFIndex i = 0; i < ABMultiValueGetCount(jobs); i++)
                {
                    NSString *job = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(jobs, i);
                    
                    [info addObject: [jobString stringByAppendingFormat: @":%@",job]];
                    // NSLog(@"Addressbook Job: %@", job);
                }
            }
            
            return [NSArray arrayWithArray:info];
    }
}

@end
//    else
//    {

//        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error)
//        {
//            if (!granted){
//                
//                NSLog(@"Just denied");
//                return;
//            }
//            
//            // ------------------
//            
//            ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
//            
//            if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined)
//            {
//                ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
//                    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, nil);
//                });
//            }
//            else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
//            {
//                
//                CFErrorRef *error = NULL;
//                ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
//                CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
//                CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
//                NSString *addressBookNum = [[NSString alloc] init];
//                
//                for(int i = 0; i < numberOfPeople; i++) {
//                    
//                    ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
//                    
//                    // NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
//                    // NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
//                    // NSLog(@"Name:%@ %@", firstName, lastName);
//                    
//                    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
//                    [[UIDevice currentDevice] name];
//                    
//                    //NSLog(@"\n%@\n", [[UIDevice currentDevice] name]);
//                    
//                    for (CFIndex i = 0; i < ABMultiValueGetCount(phoneNumbers); i++) {
//                        NSString *phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, i);
//                        
//                        addressBookNum = [addressBookNum stringByAppendingFormat: @":%@",phoneNumber];
//                        NSLog(@"AddressbookNum: %@", addressBookNum);
//                    }  
//                }
//                NSLog(@"AllNumber:%@", addressBookNum);
//            }
//            
//            // -----------
//            NSLog(@"Just authorized");
//        });
//        
//        NSLog(@"Not determined");
//    }
    
//    return @[];
}

@end
