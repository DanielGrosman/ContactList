//
//  InputCollector.h
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

// The first method outputs an NSString, and takes in an NSString called promptString. That means that when this method is invoked, a string will have to be provided as input using the method:string syntax. Whatever string is passed in will then become promtString
- (NSString *)inputForPrompt:(NSString *)promptString;

// These 2 methods output NSStrings
- (NSString *)contactName;
- (NSString *)contactEmail;

@end
