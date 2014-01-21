//
//  WCFastCell.m
//  Cloudy
//
//  Created by Wojciech Czekalski on 25.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import "WCFastCell.h"
#import "WCFCObject.h"
#import <objc/runtime.h>
#import "WCFastCell+PrivateAdditions.h"

@implementation WCFastCellDrawingLayerDelegate

-(void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {

    UIGraphicsPushContext(ctx);
    for (WCFCObject *object in [self.cell objectsForLayer:layer]) {
        [object drawInContext:ctx];
    }
    UIGraphicsPopContext();
}

@end

@interface WCFastCell ()

@property (nonatomic, strong) CALayer *drawingLayer;
@property (nonatomic, strong) NSMutableSet *mutableObjects;

@end

static inline BOOL WCFCExchangeUIViewToCellObject(UIView *view, WCFastCell *cell) {
    WCFCObject *object = [view WCFCObjectRepresentation];
    if (object) {
        [cell addObject:object];
        [view removeFromSuperview];
        return YES;
    }
    return NO;
}

@implementation WCFastCell {
    WCFastCellDrawingLayerDelegate *_layerDelegate;
}

#pragma mark - Initializing

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(instancetype) init {
    self = [super init];
    
    if (self) {
    }
    return self;
}

#pragma mark Loading from NIB

-(void) setValue:(id)value forKey:(NSString *)key {
    const BOOL isFastCell = [self isMemberOfClass:[WCFastCell class]];
    if (isFastCell) {
        if ([value isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)value;
            WCFCExchangeUIViewToCellObject(view, self);
        }
    }
    [super setValue:value forKey:key];
}

-(void) removeOccurenciesOfWCObjectsInView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        WCFCExchangeUIViewToCellObject(subView, self);
    }
}

-(void) awakeFromNib {
    [self removeOccurenciesOfWCObjectsInView:self.contentView];
    self.drawingLayer.delegate = [self layerDelegate];

    [self.contentView.layer addSublayer:self.drawingLayer];
}

#pragma mark Management

-(NSSet *) objectsForLayer:(CALayer *)layer {
    return self.objects;
}

#pragma mark - Instance methods
#pragma mark WCFCObject management
-(void) addObject:(WCFCObject *) object {
    [self.mutableObjects addObject:object];
    [self displayRefreshNeeded:object];
}

-(BOOL) removeObject:(WCFCObject *)object {
    if ([self.mutableObjects containsObject:object]) {
        [self.mutableObjects removeObject:object];
        return YES;
    }
    return NO;
}

-(NSSet *) objects {
    return [NSSet setWithSet:self.mutableObjects];
}

#pragma mark Drawing

-(void) displayRefreshNeeded:(WCFCObject *) object {
    [self.drawingLayer setNeedsDisplay];
}

#pragma mark View cycle management

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if (self.drawingLayer.delegate) {
        self.drawingLayer.delegate = nil;
    }
}

#pragma mark - Lazy loading

-(WCFastCellDrawingLayerDelegate *) layerDelegate {
    if (!_layerDelegate) {
        _layerDelegate = [[WCFastCellDrawingLayerDelegate alloc] init];
        _layerDelegate.cell = self;
    }
    return (WCFastCellDrawingLayerDelegate *) _layerDelegate;
}

-(CALayer *) drawingLayer {
    if (!_drawingLayer) {
        CALayer *drawingLayer = [CALayer layer];
        drawingLayer.frame = self.contentView.frame;
        drawingLayer.backgroundColor = self.contentView.backgroundColor.CGColor;
        drawingLayer.contentsScale = [[UIScreen mainScreen] scale];
        _drawingLayer = drawingLayer;
    }
    return _drawingLayer;
}

-(NSMutableSet *) mutableObjects {
    if (!_mutableObjects) {
        _mutableObjects = [NSMutableSet set];
    }
    return _mutableObjects;
}

-(void) layoutSubviews {
    [super layoutSubviews];
}

@end
