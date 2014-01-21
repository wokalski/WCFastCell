//
//  WCFCImageView.m
//  Cloudy
//
//  Created by Wojciech Czekalski on 22.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import "WCFCImageView.h"

@implementation WCFCImageView {
    @private
    UIImageView *__weak relativeImageView;
}
#pragma mark - Initializing

-(instancetype) initWithImageView:(UIImageView *)imageView {
    
    self = [super initWithView:imageView];
    
    if (self) {
        _image = imageView.image;
        _blendMode = kCGBlendModeNormal;
        relativeImageView = imageView;
        [relativeImageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:0];
    }
    return self;
}

#pragma mark - Drawing

-(void) drawInContext:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);
    CGContextSaveGState(ctx);
    CGContextSetAlpha(ctx, self.alpha);
    if (self.mask) {
        CGImageRef maskReference = self.mask.CGImage;
        
        CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
                                                 CGImageGetHeight(maskReference),
                                                 CGImageGetBitsPerComponent(maskReference),
                                                 CGImageGetBitsPerPixel(maskReference),
                                                 CGImageGetBytesPerRow(maskReference),
                                                 CGImageGetDataProvider(maskReference),
                                                 NULL,
                                                 YES
                                                 );
        
        CGImageRef maskedReference = CGImageCreateWithMask(self.image.CGImage, imageMask);
        CGImageRelease(imageMask);
        
        [[UIImage imageWithCGImage:maskedReference] drawInRect:self.frame blendMode:self.blendMode alpha:self.alpha];
        CGImageRelease(maskedReference);
        CGContextRestoreGState(ctx);
        UIGraphicsPopContext();
        
        return;
    }
    
    
    [self.image drawInRect:self.frame blendMode:self.blendMode alpha:self.alpha];
    
    CGContextRestoreGState(ctx);
    UIGraphicsPopContext();
}

#pragma mark - KVO

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.image = change[NSKeyValueChangeNewKey];
    [self refreshDisplay];
}

#pragma mark - Setters

-(void) setImage:(UIImage *)image {
    if (image == self.image) {
        return;
    }
    _image = image;
    [self refreshDisplay];
}

-(void) setMask:(UIImage *)mask {
    if (mask == self.mask) {
        return;
    }
    _mask = mask;
    [self refreshDisplay];
}

-(void) setBlendMode:(CGBlendMode)blendMode {
    if (blendMode == self.blendMode) {
        return;
    }
    _blendMode = blendMode;
    [self refreshDisplay];
}

-(void) dealloc {
    [relativeImageView removeObserver:self forKeyPath:@"image"];
}

@end
