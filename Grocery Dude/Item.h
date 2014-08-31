//
//  Item.h
//  New Grocery Dude
//
//  Created by Pedro Contreras Nava on 30/08/14.
//  Copyright (c) 2014 Tim Roadley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LocationAtHome, LocationAtShop, Unit;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSNumber * collected;
@property (nonatomic, retain) NSNumber * listed;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photoData;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) LocationAtHome *locationAtHome;
@property (nonatomic, retain) LocationAtShop *locationAtShop;
@property (nonatomic, retain) Unit *unit;

@end
