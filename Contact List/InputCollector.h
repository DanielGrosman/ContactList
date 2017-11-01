//
//  InputCollector.h
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

// The first method outputs an NSString, and takes in an NSString called promptString
- (NSString *)inputForPrompt:(NSString *)promptString;

// These 2 methods output NSStrings
- (NSString *)contactName;
- (NSString *)contactEmail;

@end
