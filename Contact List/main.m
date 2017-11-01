//
//  main.m
//  Contact List
//
//  Created by Daniel Grosman on 2017-10-31.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL appRunning = YES;
        

        NSString *mainMenu = @"\nnew - Create a New Contact List\nlist - List all Contacts\nshow - Show contacts by ID\nfind - Find a Contact\nquit - Exit Application";
        InputCollector *inputCollector = [[InputCollector alloc]init];
        ContactList *contactList = [[ContactList alloc] init];
        
        
        while (appRunning) {
        
        NSString *usernameInput = [inputCollector inputForPrompt:mainMenu];
        
        if ([usernameInput isEqualToString:@"quit"]) {
            appRunning = NO;
            continue;
        }
        else if ([usernameInput isEqualToString:@"new"]) {
            Contact *contact1 = [[Contact alloc] init];
            contact1.name = [inputCollector contactName];
            contact1.email = [inputCollector contactEmail];
            
            [contactList addContact:contact1];
        }
        else if ([usernameInput isEqualToString:@"list"]) {
            [contactList printContacts];
        }
        else if ([usernameInput hasPrefix:@"show"]){
            NSString *show = @"show ";
            NSRange range = NSMakeRange([show length],([usernameInput length]-[show length]));
            NSString *contactIndex = [usernameInput substringWithRange:range];
            NSInteger contactIndexNumber = [contactIndex intValue];
            
            if (contactIndexNumber >([contactList.contactList count]-1)){
                NSLog(@"You don't have that many friends!");
        }
            else {
                Contact *selected = contactList.contactList[contactIndexNumber];
                NSLog(@"\nIndex:%ld\nName:%@\nEmail:%@", contactIndexNumber, selected.name, selected.email);
            }
        }
            
            else if ([usernameInput hasPrefix:@"find"]){
                NSString *find = @"find ";
                NSRange findRange = NSMakeRange([find length],([usernameInput length]-[find length]));
                NSString *findWord = [usernameInput substringWithRange:findRange];
                
                NSArray *findKeyWord = contactList.contactList;
                NSInteger findIndex;
                for (Contact * contact in findKeyWord) {
                    if([contact.name containsString:findWord]){
                       findIndex = [findKeyWord indexOfObject:contact];
                    }
                }
                Contact *findSelected = contactList.contactList[findIndex];
                NSLog(@"\nIndex:%ld\nName:%@\nEmail:%@", findIndex, findSelected.name, findSelected.email);
                
            }
        }
    return 0;

}
}
