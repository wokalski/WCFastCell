//
//  WCFastCellDrawingLayerDelegate.h
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 28.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCFastCellCommon.h"

@interface WCFastCellDrawingLayerDelegate : NSObject
@property (nonatomic, weak) id<WCFastCellCommon> cell;
@end
