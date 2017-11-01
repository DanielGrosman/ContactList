//
//  ContactList.m
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addContact:(Contact *)newContact {
    [self.contactList addObject:newContact];
}

- (void) printContacts {
    for (Contact* contact in _contactList) {
        NSLog(@"\n%lu: <%@> (%@)", [self.contactList indexOfObject:contact], contact.name, contact.email);
    }
}


@end
