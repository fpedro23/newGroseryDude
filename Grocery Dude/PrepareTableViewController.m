//
//  PrepareTableViewController.m
//  GroceryDude
//
//  Created by Pedro Contreras Nava on 30/08/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "PrepareTableViewController.h"
#import "CoreDataHelper.h"
#import "Item.h"
#import "Unit.h"
#import "AppDelegate.h"




@interface PrepareTableViewController ()

@end

@implementation PrepareTableViewController
#define debug 1

#pragma mark - DATA
- (void)configureFetch {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    CoreDataHelper *cdh = [(AppDelegate*)[[UIApplication sharedApplication] delegate]cdh];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    
    request.sortDescriptors = [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"locationAtHome.storedIn" ascending:YES],                                [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],                               nil];
    
    [request setFetchBatchSize:50];
    
    self.frc = [[NSFetchedResultsController alloc] initWithFetchRequest:request                                         managedObjectContext:cdh.context sectionNameKeyPath:@"locationAtHome.storedIn" cacheName:nil];
     self.frc.delegate = self;
}

#pragma mark - VIEW
- (void)viewDidLoad {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    [super viewDidLoad];
    [self configureFetch];
    
    [self performFetch]; self.clearConfirmActionSheet.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(performFetch)                                            name:@"SomethingChanged" object:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    static NSString *cellIdentifier = @"Item Cell"; UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier                                    forIndexPath:indexPath]; cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    Item *item = [self.frc objectAtIndexPath:indexPath];
    
    NSMutableString *title = [NSMutableString stringWithFormat:@"%@%@ %@",
                              item.quantity, item.unit.name, item.name]; [title replaceOccurrencesOfString:@"(null)"                                                                                                withString:@"" options:0                                                                                                     range:NSMakeRange(0, [title length])];
    
    cell.textLabel.text = title;
    // make selected items orange
    
    if ([item.listed boolValue]) {
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18]];
        [cell.textLabel setTextColor:[UIColor orangeColor]];
    }
    else {
    [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:16]];
    [cell.textLabel setTextColor:[UIColor grayColor]];
    }
return cell;
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView { if (debug==1) {
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd)); }
    return nil; // we don't want a section index.
}

@end
