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
// creates a BOOL to test if the while loop should continue. later, this can be used to quit the loop if the oppRunning BOOL becomes NO
        
        BOOL appRunning = YES;

// defines the mainMenu string
        
        NSString *mainMenu = @"\nnew - Create a New Contact List\nlist - List all Contacts\nshow - Show contacts by ID\nfind - Find a Contact\nquit - Exit Application";
        
// initializes the InputCollector class and the ContactList class so they can be used later
        
        InputCollector *inputCollector = [[InputCollector alloc]init];
        ContactList *contactList = [[ContactList alloc] init];
        
        while (appRunning) {
            
// creates a string called usernameInput. on the right side of this, the inputForPrompt method is invoked. This method first prints whatever is passed in as the stringPrompt, which in this case is mainMenu, and then takes the fget from the user, and parses it. That parsed input is what is now equal to userNameInput
        
        NSString *usernameInput = [inputCollector inputForPrompt:mainMenu];

// makes the while loop false if the userNameInput is quit
       
            if ([usernameInput isEqualToString:@"quit"]) {
            appRunning = NO;
            continue;
        }
            
// if the user enters new, an instance of the Contact class is created. the next line assigns a name and email to the contact by invoking the inputCollector method contactName and contactEmail, which ask the user for a Name and an email and assign those to contact1.name and contact1.email
            
        else if ([usernameInput isEqualToString:@"new"]) {
            Contact *contact1 = [[Contact alloc] init];
            contact1.name = [inputCollector contactName];
            contact1.email = [inputCollector contactEmail];
            
// the addContact method is invoked. This method says take whatever input is passed, which is a Contact object (an instance of Contact), call it 'newContact' and add it to the array. In this case, we are saying to take the contact1 object that we just created, and add it to the array
            [contactList addContact:contact1];
        }
            
        else if ([usernameInput isEqualToString:@"list"]) {
            [contactList printContacts];
        }
            
// If the users answer contains show, defines a string called "show " and calculates the length of that string. Then created a range of charachters that begind at the end of the length of show, and ends with the full usernameInput minus the length of show. That range now holds only the number portion of the users response. Converts that range string into an int so we can use it to check the index #
       
        else if ([usernameInput hasPrefix:@"show"]){
            NSString *show = @"show ";
            NSRange range = NSMakeRange([show length],([usernameInput length]-[show length]));
            NSString *contactIndex = [usernameInput substringWithRange:range];
            NSInteger contactIndexNumber = [contactIndex intValue];
 
// If the index # they are looking for is higher than the number of contacts in the contact list, it will return that you dont have that many friends
            
            if (contactIndexNumber >([contactList.contactList count]-1)){
                NSLog(@"You don't have that many friends!");
        }
            
// otherwise, create a Contact, and assign it the value of the contact at the index selected by the user. Print that infor back to the user
            
            else {
                Contact *selected = contactList.contactList[contactIndexNumber];
                NSLog(@"\nIndex:%ld\nName:%@\nEmail:%@", contactIndexNumber, selected.name, selected.email);
            }
        }

// if the users answer contains find, define a range (same as above) to find the words that the user typed in after the word find (it will be s name)
            else if ([usernameInput hasPrefix:@"find"]){
                NSString *find = @"find ";
                NSRange findRange = NSMakeRange([find length],([usernameInput length]-[find length]));
                NSString *findWord = [usernameInput substringWithRange:findRange];

// create an NS array which essentially copies the contactList. Loops through the contacts in the copy of the array. If any of the contacts in the array contain the words in the range defined above, then create an int that holds the index value of that contact
                NSArray *findKeyWord = contactList.contactList;
                NSInteger findIndex;
                for (Contact * contact in findKeyWord) {
                    if([contact.name containsString:findWord]){
                       findIndex = [findKeyWord indexOfObject:contact];
                    }
                }
                
// create a Contact, and assign it the valye of the contact at the index created above. print that information back to the user
                Contact *findSelected = contactList.contactList[findIndex];
                NSLog(@"\nIndex:%ld\nName:%@\nEmail:%@", findIndex, findSelected.name, findSelected.email);
                
            }
        }
    return 0;

}
}
