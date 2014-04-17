//
//  WCFastCellCommon.h
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 28.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCFCLabel.h"
#import "WCFCObject.h"
#import "WCFCImageView.h"

@protocol WCFastCellCommon <NSObject>

@property (nonatomic, strong, readonly) NSSet *objects;

-(void) addObject:(WCFCObject *) object;
-(BOOL) removeObject:(WCFCObject *) object;
-(void) displayRefreshNeeded:(WCFCObject *) object;

@end

FOUNDATION_EXPORT BOOL WCFCExchangeUIViewToCellObject(UIView *view, id<WCFastCellCommon> cell);