//
//  WCTestViewController.m
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 21.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import "WCTestViewController.h"
#import "WCTestCell.h"
#import "NSString+RandomString.h"

@interface WCTestViewController ()

@end

@implementation WCTestViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    WCTestCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    for (UILabel *label in cell.labels) {
        label.text = [NSString randomStringWithLength:10];
    }
    
    return cell;
}

@end
