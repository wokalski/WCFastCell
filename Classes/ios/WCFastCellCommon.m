//
//  WCFastCellCommon.m
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 28.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import "WCFastCellCommon.h"
#import "WCFastCell+PrivateAdditions.h"

inline BOOL WCFCExchangeUIViewToCellObject(UIView *view, id<WCFastCellCommon> cell){
    WCFCObject *object = [view WCFCObjectRepresentation];
    if (object) {
        [cell addObject:object];
        [view removeFromSuperview];
        return YES;
    }
    return NO;
}