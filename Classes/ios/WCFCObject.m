//
//  WCFCObject.m
//  Cloudy
//
//  Created by Wojciech Czekalski on 22.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import "WCFCObject.h"

@implementation WCFCObject {
    BOOL isObserver;
}
-(instancetype) initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        self.frame = view.frame;
        self.alpha = view.alpha;
        isObserver = YES;
        self.backgroundColor = view.backgroundColor ? view.backgroundColor : [UIColor clearColor];
        [view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:0];
        [view addObserver:self forKeyPath:@"alpha" options:NSKeyValueObservingOptionNew context:0];
        [view addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:0];
        _relativeView = view;
    }
    return self;
}

-(void) drawInContext:(CGContextRef)ctx {
    return;
}

-(void) refreshDisplay {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"wcfc_displayNeeded" object:self];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self setValue:change[NSKeyValueChangeNewKey] forKey:keyPath];
    [self refreshDisplay];
}

-(void) dealloc {
    if (isObserver) {
        [_relativeView removeObserver:self forKeyPath:@"frame"];
        [_relativeView removeObserver:self forKeyPath:@"alpha"];
        [_relativeView removeObserver:self forKeyPath:@"backgroundColor"];
    }
}

-(void)  setFrame:(CGRect)frame {
    if (CGRectEqualToRect(frame, _frame)) {
        return;
    }
    _frame = frame;
    [self refreshDisplay];
}

@end
