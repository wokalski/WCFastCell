//
//  WCFastCell+PrivateAdditions.h
//  Cloudy
//
//  Created by Wojciech Czekalski on 03.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import "WCFastCell.h"
#import "WCFastCellDrawingLayerDelegate.h"

@protocol WCFastCellPrivateAdditions <NSObject>

@property (nonatomic, strong, readonly) CALayer *drawingLayer;
@property (nonatomic, strong, readonly) NSMutableSet *mutableObjects;
@property (nonatomic, strong, readonly) WCFastCellDrawingLayerDelegate *layerDelegate;

-(void) removeOccurenciesOfWCObjectsInView:(UIView *) view;
@end

@interface UIView (WCFCObject)
-(WCFCObject *) WCFCObjectRepresentation;
@end

@implementation UIView (WCFCObject)

-(WCFCObject *) WCFCObjectRepresentation {
    WCFCObject *object = nil;
    
    if ([self class] == [UILabel class]) {
        object = [[WCFCLabel alloc] initWithLabel:(UILabel *)self];
    } else if ([self class] == [UIImageView class]) {
        object = [[WCFCImageView alloc] initWithImageView:(UIImageView *) self];
    }

    return object;
}

@end