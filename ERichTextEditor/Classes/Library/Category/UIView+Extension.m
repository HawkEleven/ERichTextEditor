//
//  UIView+Extension.m
//  ERichTextEditor
//
//  Created by Eleven on 2018/7/29.
//  Copyright © 2018年 Eleven. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>


@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)halfWidth {
    return CGRectGetWidth(self.frame) * 0.5;
}

- (CGFloat)halfHeight {
    return CGRectGetHeight(self.frame) * 0.5;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setCornerRadius:(CGFloat)cornerRadius rounding:(UIRectCorner)rounding {
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rounding cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}
- (void)setMaxX:(CGFloat)maxX {
    self.x = maxX - CGRectGetWidth(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}
- (void)setMaxY:(CGFloat)maxY {
    self.y = maxY - CGRectGetHeight(self.frame);
}

- (void)setMaxOrigin:(CGPoint)maxOrigin {
    CGRect frame = self.frame;
    frame.origin = CGPointMake(maxOrigin.x - CGRectGetWidth(self.frame), maxOrigin.y - CGRectGetHeight(self.frame));
    self.frame = frame;
}

- (CGPoint)maxOrigin {
    return CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame));
}

@end
