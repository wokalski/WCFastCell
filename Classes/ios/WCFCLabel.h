//
//  WCFCLabel.h
//  Cloudy
//
//  Created by Wojciech Czekalski on 22.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import "WCFCObject.h"

@interface WCFCLabel : WCFCObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSAttributedString *attributedText;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic) NSLineBreakMode lineBreakMode;
@property (nonatomic) NSTextAlignment textAlignment;

-(instancetype) initWithLabel:(UILabel *) label;

@end
