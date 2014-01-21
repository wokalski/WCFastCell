//
//  WCFCObject.h
//  Cloudy
//
//  Created by Wojciech Czekalski on 22.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WCFCObject : NSObject

@property (nonatomic) CGRect frame;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic) float alpha;
@property (nonatomic, readonly, strong) UIView *relativeView;

-(instancetype) initWithView:(UIView *) view;

-(void) drawInContext:(CGContextRef) ctx;

-(void) refreshDisplay;

@end
