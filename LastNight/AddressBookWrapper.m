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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
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
            
            NSString* firstName = (__bridge NSString*) ABRecordCopyValue( person, kABPersonFirstNameProperty );
            NSString* lastName = (__bridge NSString* ) ABRecordCopyValue( person, kABPersonLastNameProperty );
            NSDate* createDate = (__bridge NSDate*) ABRecordCopyValue( person, kABPersonCreationDateProperty );
            NSString* formattedDate = [dateFormatter stringFromDate:createDate];

            
            if (firstName != nil) {
                if (lastName != nil) {
                    NSArray *personInfo = @[firstName, lastName, createDate];
                    [info addObject:personInfo];
                }
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
