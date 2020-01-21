//
//  LSIPersonController.h
//  StarWarsSearch-Objc
//
//  Created by Niranjan Kumar on 1/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSIPersonController : NSObject

//func searchForPerson(name: String, completion: (people, error) -> ())

// Swift = closures (unnamed function)
// Objc = block (unnamed function)


// Declaring

- (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
                           completion:(void (^)(NSArray *people, NSError *error))completion;

//completion(people, nil);

@end
