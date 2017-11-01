//
//  ContactList.m
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

// Needs to be initialized here so new contacts can be added to the array when they are created
- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactList = [[NSMutableArray alloc] init];
    }
    return self;
}

// when called, takes a Contact Object, calls it 'newContact' and adds it to the contactList array
- (void) addContact:(Contact *)newContact {
    [self.contactList addObject:newContact];
}

//defines the print method which cycles through all of the contacts in the contactList array, and prints out the details for each one
- (void) printContacts {
    for (Contact *contact in _contactList) {
        NSLog(@"\n%lu: <%@> (%@)", [self.contactList indexOfObject:contact], contact.name, contact.email);
    }
}


@end
