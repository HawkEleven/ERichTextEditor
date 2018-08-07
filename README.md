#### 导语

> 本方案参考 **[ZSSRichTextEditor](https://github.com/nnhubbard/ZSSRichTextEditor)**，使用**UIWebView**实现富文本形式的图文混编。笔者对部分常用设置进行封装，如：设置字体大小、颜色、样式等。

![效果图.png](https://upload-images.jianshu.io/upload_images/1338824-aee6f15621d0d5d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 介绍

资源文件 | 说明
---- | ----
ZSSRichTextEditor.js | 文本及图片的设置
editor.html | 模板

封装文件 | 说明
---- | ----
ERichTextEditorView | 对JS方法进行封装
ContentEditFooterView | 底部视图
ERichTextToolBar | 常规设置视图

**字体的常规设置：**

	- (void)setBold;
	- (void)setItalic;
	- (void)setUnorderedList;
	- (void)setOrderedList;
	- (void)setBlockquote;
	- (void)setStrikethrough;
	- (void)setSelectedColor:(NSString *)hexColor;
	- (void)heading1;
	- (void)heading2;
	- (void)heading3;
	- (void)heading4;
	- (void)undo;

### 结尾

若大家有其他需求可以在**ERichTextEditorView**基础上进行拓展添加，欢迎star~