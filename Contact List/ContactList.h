//
//  ContactList.h
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
@interface ContactList : NSObject

// Defines a mutable array names contactList (items in the array to be added later)
@property (nonatomic, strong) NSMutableArray* contactList;


- (void) addContact:(Contact*)newContact;

- (void) printContacts;

@end
