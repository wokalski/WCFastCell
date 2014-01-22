//
//  TestCellViewController.m
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 21.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import "TestCellViewController.h"
#import "TestCell.h"
#import "NSString+RandomString.h"

@interface TestCellViewController ()

@end

@implementation TestCellViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.label1.text = [NSString randomStringWithLength:10];
    cell.label2.text = [NSString randomStringWithLength:10];
    cell.label3.text = [NSString randomStringWithLength:10];
    cell.label4.text = [NSString randomStringWithLength:10];
    cell.label5.text = [NSString randomStringWithLength:10];
    cell.label6.text = [NSString randomStringWithLength:10];
    
    return cell;
}

@end
