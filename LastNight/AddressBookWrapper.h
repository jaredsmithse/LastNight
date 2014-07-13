//
//  AddressBookWrapper.h
//  LastNight
//
//  Created by Patrick Reynolds on 7/12/14.
//  Copyright (c) 2014 Patrick Reynolds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface AddressBookWrapper : NSObject

//@property (nonatomic, readonly) ABAddressBookRef *addressBook;
//@property (strong, nonatomic) NSArray *contacts;
//
//- (id)initWithAddressBook: (ABAddressBookRef *)addressBook;
+(NSArray *)getContactsForSearchType: (NSString *)type;

@end
