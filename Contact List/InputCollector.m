//
//  InputCollector.m
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

// Prints out the promptString, which is whatever string is passed to this method when it is invoked. and then fgets the option chosen from the user (converts it to Objective C string and parses it)
- (NSString *)inputForPrompt:(NSString *)promptString; {
    NSLog(@"%@", promptString);
    char userInput[20];
    fgets(userInput, 20, stdin);
    NSString * input = [NSString stringWithUTF8String:userInput];
    NSString *parsedInput = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return parsedInput;
}

// when called, fgets a name from the user
- (NSString *)contactName {
    char name[20];
    NSLog(@"\nContact Name: \n");
    fgets(name, 20, stdin);
    NSString * userName = [NSString stringWithUTF8String:name];
    NSString *parsedUserName = [userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return parsedUserName;
}

// when called, fgets an email from the user
- (NSString *)contactEmail {
    char email[50];
    NSLog(@"\nContact Email: \n");
    fgets(email, 50, stdin);
    NSString * userEmail = [NSString stringWithUTF8String:email];
    NSString *parsedUserEmail = [userEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return parsedUserEmail;
}



@end
