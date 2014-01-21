//
//  WCFCImageView.h
//  Cloudy
//
//  Created by Wojciech Czekalski on 22.11.2013.
//  Copyright (c) 2013 Wojciech Czekalski. All rights reserved.
//

#import "WCFCObject.h"
@interface WCFCImageView : WCFCObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *mask;
@property (nonatomic) CGBlendMode blendMode;


-(instancetype) initWithImageView:(UIImageView *) imageView;

@end
