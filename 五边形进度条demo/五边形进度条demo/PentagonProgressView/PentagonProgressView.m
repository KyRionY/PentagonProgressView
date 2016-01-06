//
//  PentagonProgressView.m
//  五边形进度条demo
//
//  Created by asun on 15/11/9.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import "PentagonProgressView.h"

@implementation PentagonProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame progressBackgroundColor:(UIColor*)progressBackgroundColor completeColor:(UIColor*)completeColor lineWidth:(CGFloat)lineWidth {
    if (self = [super initWithFrame:frame]) {
        self.progressBackgroundColor = progressBackgroundColor;
        self.completeColor = completeColor;
        self.lineWidth = lineWidth;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(CGFloat)lineWidth {
    return _lineWidth ? _lineWidth : 10;
}

- (UIColor *)progressBackgroundColor {
    return _progressBackgroundColor ? _progressBackgroundColor : [UIColor grayColor];
}

- (UIColor *)completeColor {
    return _completeColor ? _completeColor : [UIColor blueColor];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // 画背景色
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置线宽
    CGContextSetLineWidth(ctx, self.lineWidth);
    
    // 背景五边形
    CGMutablePathRef path = CGPathCreateMutable();
    
    [self.progressBackgroundColor set];

    CGPathMoveToPoint(path, NULL, rect.size.width * 0.096, rect.size.height * 0.41);
    
    CGPathAddLineToPoint(path, NULL, rect.size.width * 0.5, rect.size.height * 0.116);
    
    CGPathAddLineToPoint(path, NULL, rect.size.width * 0.904, rect.size.height * 0.41);
    
    CGPathAddLineToPoint(path, NULL, rect.size.width * 0.75, rect.size.height * 0.885);
    
    CGPathAddLineToPoint(path, NULL, rect.size.width * 0.25, rect.size.height * 0.885);
    
    CGPathCloseSubpath(path);

    CGContextAddPath(ctx, path);
    
    CGContextStrokePath(ctx);
    
    // 进度条
    CGMutablePathRef completePath = CGPathCreateMutable();
    [self.completeColor set];
    if (self.progress > 0) {
        if (self.progress > 0 && self.progress <= 40) {
            CGFloat progress = self.progress / 40;
            CGPathMoveToPoint(completePath, NULL, rect.size.width * (0.404 * progress + 0.096), rect.size.height * (0.295 * (1 - progress) + 0.115));
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.096, rect.size.height * 0.41);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * (0.154 * progress + 0.096), rect.size.height * (0.475 * progress + 0.41));

        } else if (self.progress > 40 && self.progress <= 80) {
            CGFloat progress = (self.progress - 40) / 40;
            
            CGPathMoveToPoint(completePath, NULL, rect.size.width * (0.404 * progress + 0.5), rect.size.height * (0.295 * progress + 0.115));
            
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.5, rect.size.height * 0.116);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.096, rect.size.height * 0.41);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.25, rect.size.height * 0.885);
            
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * (0.5 * progress + 0.25), rect.size.height * 0.885);
            
        } else {
            CGFloat progress = (self.progress - 80) / 20;
            CGPathMoveToPoint(completePath, NULL, rect.size.width * (0.904 - 0.0752 * progress), rect.size.height * (0.237 * progress + 0.41));
            
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.904, rect.size.height * 0.41);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.5, rect.size.height * 0.116);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.096, rect.size.height * 0.41);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.25, rect.size.height * 0.885);
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * 0.75, rect.size.height * 0.885);
            
            CGPathAddLineToPoint(completePath, NULL, rect.size.width * (0.0752 * progress + 0.75), rect.size.height * (0.885 - 0.238 * progress));
        }
        CGContextAddPath(ctx, completePath);
    }
    CGContextStrokePath(ctx);
    
    CGPathRelease(path);
    CGPathRelease(completePath);
}


- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}



@end
