//
//  LocationAtHome.h
//  New Grocery Dude
//
//  Created by Pedro Contreras Nava on 30/08/14.
//  Copyright (c) 2014 Tim Roadley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Location.h"

@class Item;

@interface LocationAtHome : Location

@property (nonatomic, retain) NSString * storedIn;
@property (nonatomic, retain) NSSet *items;
@end

@interface LocationAtHome (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
