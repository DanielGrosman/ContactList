//
//  InputCollector.h
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

- (NSString *)inputForPrompt:(NSString *)promptString;
- (NSString *)contactName;
- (NSString *)contactEmail;

@end
