//
//  Contact.h
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

// Defines the properties of a Contact. Every contact will have a name and an email
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* email;

@end
