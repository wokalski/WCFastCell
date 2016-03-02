//
//  WCFrameRateViewController.m
//  WCFastCellTest
//
//  Created by Wojciech Czekalski on 02.03.2016.
//  Copyright © 2016 Wojciech Czekalski. All rights reserved.
//

#import "WCFrameRateViewController.h"

@interface WCFrameRateViewController () {
    CFTimeInterval lastSecondFrameTimes[60];
}
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UILabel *framerateLabel;
@property CFTimeInterval displayLinkTickTimeLast;
@property NSInteger frameNumber;
@end

@implementation WCFrameRateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [UILabel new];
    label.frame = self.view.bounds;
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:label];
    self.framerateLabel = label;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(fire:)];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes]; //This causes a potential memory leak but this is meant to be running throught the whole lifecycle of the application
}

- (void)fire:(CADisplayLink *)displayLink {
    
    lastSecondFrameTimes[self.frameNumber] = displayLink.timestamp;
    
    if (self.frameNumber+1 == 60) {
        CFTimeInterval average = 0;
        CFTimeInterval last = lastSecondFrameTimes[0];
        for (int i = 1; i < 60; i++) {
            
            average += lastSecondFrameTimes[i] - last;
            last = lastSecondFrameTimes[i];
        }
        average /= 60;
        
            self.framerateLabel.text = [NSString stringWithFormat:@"FPS: %.2f", 1/average];
    }
    
    self.frameNumber = (self.frameNumber + 1) % 60;
}

@end
