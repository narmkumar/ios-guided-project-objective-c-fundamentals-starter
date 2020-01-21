//
//  LSIPerson.m
//  StarWarsSearch-Objc
//
//  Created by Niranjan Kumar on 1/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIPerson.h"

@implementation LSIPerson

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self != nil) {
        // Setup our object
        
        // 2. Pull out the data from the dictionary
        
        NSString *name = dictionary[@"name"];
        NSString *height = dictionary[@"height"];
        NSString *birthYear = dictionary[@"birth_year"];
        NSString *eyeColor = dictionary[@"eye_color"];
        
        
    }
    return self;
}


@end
