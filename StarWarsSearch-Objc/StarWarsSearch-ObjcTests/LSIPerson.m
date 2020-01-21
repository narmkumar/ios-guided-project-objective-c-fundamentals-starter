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
        
     return [self initWithName:name birthYear:birthYear height:height eyeColor:eyeColor];
        }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                   birthYear:(NSString *)birthYear
                      height:(NSString *)height
                    eyeColor:(NSString *)eyeColor {
    self = [super init];
    if (self != nil) {

        // Always use the _instanceVariable to do the assignment
        // so that you don't have any side effects from custom setters

//        self.name = name; // Ok for Swift, not Objective-C
        
        _name = name;
        _birthYear = birthYear;
        _height = height;
        _eyeColor = eyeColor;
    }
    return self;
}

- (void)helperFunction {

    // Use self.name in non-init methods
    self.name = @"Bob";
}


@end
