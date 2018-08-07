//
//  Eleven.h
//  Krom
//
//  Created by Eleven on 2018/4/29.
//  Copyright © 2018年 QW. All rights reserved.
//

#ifndef Eleven_h
#define Eleven_h

/////////////////////////////////////////////////////////////////////////////////

// 判断是否iPhone X
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// status bar height.
#define STATUS_BAR_HEIGHT (IS_iPhoneX ? 44.f : 20.f)

// Navigation bar height.
#define NAVIGATION_BAR_HEIGHT 44.f

// Status bar & navigation bar height.
#define STATUS_AND_NAVIGATION_HEIGHT (IS_iPhoneX ? 88.f : 64.f)

// Tabbar height.
#define TAB_BAR_HEIGHT (IS_iPhoneX ? (49.f + 34.f) : 49.f)

// Tabbar safe bottom margin.
#define TAB_BAR_SAFE_BOTTOM_MARGIN (IS_iPhoneX ? 34.f : 0.f)

/////////////////////////////////////////////////////////////////////////////////
///  获取屏幕宽度
static inline CGFloat _getScreenWidth () {
    static CGFloat _screenWidth = 0;
    if (_screenWidth > 0) return _screenWidth;
    _screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    return _screenWidth;
}

///  获取屏幕高度
static inline CGFloat _getScreenHeight () {
    static CGFloat _screenHeight = 0;
    if (_screenHeight > 0) return _screenHeight;
    _screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    return _screenHeight;
}

#define SCREEN_HEIGHT     _getScreenHeight()
#define SCREEN_WIDTH      _getScreenWidth()
#define HALF_SCREEN_HEIGHT _getScreenHeight() * 0.5
#define HALF_SCREEN_WIDTH  _getScreenWidth() * 0.5

/////////////////////////////////////////////////////////////////////////////////

#define HexColorInt32_t(rgbValue) \
[UIColor colorWithRed:((float)((0x##rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((0x##rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(0x##rgbValue & 0x0000FF))/255.0  alpha:1]

#define HexColor(hexString) [UIColor hexColor:(hexString)]

#define EImageNamed(url) [UIImage imageNamed:url]

/////////////////////////////////////////////////////////////////////////////////
///  安全运行block
#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil;

#ifndef weakify

#if DEBUG

#if __has_feature(objc_arc)

#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;

#else

#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;

#endif

#else

#if __has_feature(objc_arc)

#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;

#else

#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;

#endif

#endif

#endif



#ifndef strongify

#if DEBUG

#if __has_feature(objc_arc)

#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;

#else

#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;

#endif

#else

#if __has_feature(objc_arc)

#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;

#else

#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;

#endif

#endif

#endif


#endif /* Eleven_h */
