//
//  WCFCLabel.m
//  Cloudy
//
//  Created by Wojciech Czekalski on 22.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import "WCFCLabel.h"

@interface WCFCLabel ()
@property (nonatomic, strong) NSMutableParagraphStyle *paragraphStyle;
@end

@implementation WCFCLabel {
    @private
    UILabel *__weak relativeLabel;
}

#pragma mark - Initializing

-(instancetype) initWithLabel:(UILabel *)label {
    self = [super initWithView:label];
    if (self) {
        _text = label.text;
        _font = label.font;
        _textColor = label.textColor;
        _lineBreakMode = label.lineBreakMode;
        _textAlignment = label.textAlignment;
        _paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        relativeLabel = label;
        [relativeLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:0];
        [relativeLabel addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:0];
        [relativeLabel addObserver:self forKeyPath:@"lineBreakMode" options:NSKeyValueObservingOptionNew context:0];
        [relativeLabel addObserver:self forKeyPath:@"textAlignment" options:NSKeyValueObservingOptionNew context:0];
        [relativeLabel addObserver:self forKeyPath:@"textColor" options:NSKeyValueObservingOptionNew context:0];
    }
    return self;
}

#pragma mark - Drawing

-(void) drawInContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    CGContextSetAlpha(ctx, self.alpha);
    if (self.attributedText) {
        [self.attributedText drawInRect:self.frame];
    } else {
        [self.backgroundColor setFill];
        CGContextFillRect(ctx, self.frame);
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        NSDictionary *attributes = @{NSFontAttributeName: self.font, NSForegroundColorAttributeName : self.textColor, NSParagraphStyleAttributeName : self.paragraphStyle};
    
    [self.text drawInRect:self.frame withAttributes:attributes];
    
#else
    [self.textColor set];
    [self.text drawInRect:self.frame withFont:self.font lineBreakMode:[self.paragraphStyle lineBreakMode] alignment:[self.paragraphStyle alignment]];
#endif
    }
    CGContextRestoreGState(ctx);
}

#pragma mark - KVO

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self setValue:change[NSKeyValueChangeNewKey] forKey:keyPath];
    [self refreshDisplay];
}

#pragma mark - Setters

-(void) setLineBreakmode:(NSLineBreakMode)lineBreakmode {
    if (lineBreakmode == self.lineBreakMode) {
        return;
    }
    _lineBreakMode = lineBreakmode;
    [self.paragraphStyle setLineBreakMode:lineBreakmode];
    [self refreshDisplay];
}

-(void) setTextAlignment:(NSTextAlignment)textAlignment {
    if (textAlignment == self.textAlignment) {
        return;
    }
    _textAlignment = textAlignment;
    [self.paragraphStyle setAlignment:self.textAlignment];
    [self refreshDisplay];
}

-(void) setFont:(UIFont *)font {
    if (font == self.font) {
        return;
    }
    _font = font;
    [self refreshDisplay];
}

-(void) setText:(NSString *)text {
    if ([text isEqualToString:self.text]) {
        return;
    }
    _text = text;
    [self refreshDisplay];
}

-(void) dealloc {
    [relativeLabel removeObserver:self forKeyPath:@"text"];
    [relativeLabel removeObserver:self forKeyPath:@"font"];
    [relativeLabel removeObserver:self forKeyPath:@"lineBreakMode"];
    [relativeLabel removeObserver:self forKeyPath:@"textAlignment"];
    [relativeLabel removeObserver:self forKeyPath:@"textColor"];
}

@end
