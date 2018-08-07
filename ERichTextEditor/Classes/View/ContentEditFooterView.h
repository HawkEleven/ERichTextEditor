//
//  ContentEditFooterView.h
//  KCWC
//
//  Created by Eleven on 2018/2/8.
//  Copyright © 2018年 HAWK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ERichTextEditorView, ERichTextToolBar;
@interface ContentEditFooterView : UIView

@property (nonatomic,   copy) void (^pictureBlock)(void);
@property (nonatomic,   copy) void (^smileBlock)(void);
@property (nonatomic,   copy) void (^linkBlock)(void);
@property (nonatomic,   copy) void (^cancelBlock)(void);
@property (nonatomic,   copy) void (^tagBlock)(void);

@property (nonatomic, strong) ERichTextToolBar *toolBar;

- (instancetype)initWithFrame:(CGRect)frame editView:(ERichTextEditorView *)editView;


@end
