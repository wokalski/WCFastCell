//
//  WCFastCellDrawingLayerDelegate.m
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 28.01.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import "WCFastCellDrawingLayerDelegate.h"

@implementation WCFastCellDrawingLayerDelegate

-(void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    for (WCFCObject *object in self.cell.objects) {
        [object drawInContext:ctx];
    }
    UIGraphicsPopContext();
}

@end