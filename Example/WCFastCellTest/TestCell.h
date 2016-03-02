//
//  TestCell.h
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 21.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@end
