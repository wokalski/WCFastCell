//
//  WCFastCell.h
//  Cloudy
//
//  Created by Wojciech Czekalski on 25.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCFCLabel.h"
#import "WCFCObject.h"
#import "WCFCImageView.h"

@protocol WCFastCellPrivateAdditions;
@class WCFastCellDrawingLayerDelegate;
@interface WCFastCell : UITableViewCell <WCFastCellPrivateAdditions>

@property (nonatomic, strong, readonly) NSSet *objects;

-(void) addObject:(WCFCObject *) object;
-(BOOL) removeObject:(WCFCObject *) object;
-(void) displayRefreshNeeded:(WCFCObject *) object;

@end

@interface WCFastCellDrawingLayerDelegate : NSObject
@property (nonatomic, weak) WCFastCell *cell;
@end
