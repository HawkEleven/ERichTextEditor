//
//  UIView+Extension.h
//  ERichTextEditor
//
//  Created by Eleven on 2018/7/29.
//  Copyright © 2018年 Eleven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign, readonly) CGFloat halfHeight;
@property (nonatomic, assign, readonly) CGFloat halfWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/** 最大 X */
@property (nonatomic, assign) CGFloat maxX;
/** 最大 Y */
@property (nonatomic, assign) CGFloat maxY;
/// 同时设置 maxX 和 maxY
@property (nonatomic, assign) CGPoint maxOrigin;

@end
