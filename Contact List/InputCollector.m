//
//  InputCollector.m
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString; {
    NSLog(@"%@", promptString);
    char userInput[20];
    fgets(userInput, 20, stdin);
    NSString * input = [NSString stringWithUTF8String:userInput];
    NSString *parsedInput = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return parsedInput;
}


- (NSString *)contactName {
    char name[20];
    NSLog(@"\nContact Name: \n");
    fgets(name, 20, stdin);
    NSString * userName = [NSString stringWithUTF8String:name];
    NSString *parsedUserName = [userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return parsedUserName;
}

- (NSString *)contactEmail {
    char email[50];
    NSLog(@"\nContact Email: \n");
    fgets(email, 50, stdin);
    NSString * userEmail = [NSString stringWithUTF8String:email];
    NSString *parsedUserEmail = [userEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return parsedUserEmail;
}



@end
