//
//  LSIPersonTests.m
//  StarWarsSearch-ObjcTests
//
//  Created by Paul Solt on 11/5/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "LSIPerson.h"

@interface LSIPersonTests : XCTestCase

@end

@implementation LSIPersonTests

- (void)testParsePersonJSON {

    NSBundle *bundle = [NSBundle bundleForClass:[self class]];

    NSData *data = loadFile(@"Person.json", bundle);

    XCTAssertNotNil(data);

    NSError *error = nil;

    // Bitmask = flags in C/Objective-C

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {

        // @"Hello" = Objective-C String
        // "World" = C string (C Programming Language)

        XCTFail(@"Error: %@", error);  // String tokens: %@ = object
    }
    NSLog(@"PERSON: %@", json);

    // JSON -> LSIPerson
    LSIPerson *luke = [[LSIPerson alloc] initWithDictionary:json];
    //    XCTAssertEqual() is for int, double, float, and primitive data types
    // XCTAssertEqualObjects() for NSString, and other objects

    NSString *name = @"Luke Skywalker";

        XCTAssertEqualObjects(name, luke.name);
        XCTAssertEqualObjects(@"19BBY", luke.birthYear);
        XCTAssertEqualObjects(@"172", luke.height);
        XCTAssertEqualObjects(@"blue", luke.eyeColor);
}


@end
