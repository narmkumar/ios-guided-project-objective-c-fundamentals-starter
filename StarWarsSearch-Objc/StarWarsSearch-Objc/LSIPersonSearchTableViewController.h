//
//  LSIPersonSearchTableViewController.h
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward class declaration - saying I have a class named LSIPersonController (don't worry!)

@class LSIPersonController;

@interface LSIPersonSearchTableViewController : UITableViewController <UISearchBarDelegate>

@property NSArray *people;

@property LSIPersonController *personController;

@end
