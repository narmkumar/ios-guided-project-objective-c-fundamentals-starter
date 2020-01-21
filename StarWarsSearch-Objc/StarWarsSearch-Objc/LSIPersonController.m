//
//  LSIPersonController.m
//  StarWarsSearch-Objc
//
//  Created by Paul Solt on 1/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIPersonController.h"
#import "LSIPerson.h"

@implementation LSIPersonController

static NSString * const baseURLString = @"https://swapi.co/api/people";

// Defining
- (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
                           completion:(void (^)(NSArray *people, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    // YES = true
    // NO = false
    
    // https://swapi.co/api/people?search=skywalker
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];
    
    // "Hello" = C string (C programming Language)
    // @"Hello" = Objective-C NSString
    [components setQueryItems:@[searchItem]];
    
    NSURL *url = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // check error, call completion
        
        // if error != nil { // SWIFT
        if (error) { //if (error != nil) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        // Data is not a Dictionary, maybe we have an error API JSON response
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(nil, [[NSError alloc] init]); // TODO: populate error details
            return;
        }
        
        // Create an array of people from the data
        NSLog(@"JSON: %@", dictionary);
        
        // Decode the data

        NSArray *personDictionaries = dictionary[@"results"];
        NSMutableArray *people = [[NSMutableArray alloc] init];
        for (NSDictionary *personDictionary in personDictionaries) {
            // Convert NSDictionary to LSIPerson
            LSIPerson *person = [[LSIPerson alloc] initWithDictionary:personDictionary];
            [people addObject:person];
        }

        completion(people, nil);
        
        
    }] resume];
    
}



@end
