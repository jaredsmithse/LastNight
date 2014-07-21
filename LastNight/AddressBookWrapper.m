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

+(NSArray *)getContactsForSearchType
{
    NSMutableArray* info = [[NSMutableArray alloc] init];
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted){
        NSLog(@"Denied");
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        NSLog(@"Authorized");
        CFErrorRef *error            = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        CFArrayRef allPeople         = ABAddressBookCopyArrayOfAllPeople(addressBook);
        CFIndex numberOfPeople       = ABAddressBookGetPersonCount(addressBook);
        
        for(int i = 0; i < numberOfPeople; i++)
        {
            ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
            
            ABMultiValueRef name = ABRecordCopyValue(person, kABPersonFirstNameProperty);
            // TODO: This still needs to be put into the return data type, should lookup 3 element tuples for objC
//            ABMultiValueRef createdAtDate = ABRecordCopyValue(person, kABPersonCreationDateProperty);
            if (name != nil) {
                [info addObject:(__bridge_transfer NSString *)(name)];
            }
        }
        
        return [NSArray arrayWithArray:info];
    } else{ //ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            if (!granted){
                NSLog(@"Just denied");
                return;
            }
            NSLog(@"Just authorized");
        });
        NSLog(@"Not determined");
    }
    return info;
    
}

@end
