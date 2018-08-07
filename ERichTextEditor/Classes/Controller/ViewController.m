//
//  ViewController.m
//  ERichTextEditor
//
//  Created by Eleven on 2018/7/29.
//  Copyright © 2018年 Eleven. All rights reserved.
//

#import "ViewController.h"
#import "ERichTextEditorView.h"
#import "ContentEditFooterView.h"

static CGFloat kFooterHeight = 44.f;

@interface ViewController ()

@property (nonatomic, strong) ERichTextEditorView *editorView;
@property (nonatomic, strong) ContentEditFooterView *footerView;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"图文编辑";
    [self.view addSubview:self.editorView];
    [self.view addSubview:self.footerView];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"导出HTML" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - notification
- (void)keyboardWillShow:(NSNotification*)notification {
    NSDictionary *info = [notification userInfo];
    CGSize size = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.footerView.y = SCREEN_HEIGHT - size.height - self.footerView.height;
    
    [self.editorView setContentHeight:SCREEN_HEIGHT - STATUS_AND_NAVIGATION_HEIGHT - TAB_BAR_SAFE_BOTTOM_MARGIN - kFooterHeight - size.height];
}

- (void)keyboardWillHide:(NSNotification*)notification {
    self.footerView.y = SCREEN_HEIGHT - TAB_BAR_SAFE_BOTTOM_MARGIN - self.footerView.height;
    
    [self.editorView setContentHeight:SCREEN_HEIGHT - STATUS_AND_NAVIGATION_HEIGHT - TAB_BAR_SAFE_BOTTOM_MARGIN - kFooterHeight];
}

#pragma mark - event response
- (void)rightClick {
    NSString *htmlStr = [self.editorView getHTML];
    NSLog(@"\n=====\n%@\n=====", htmlStr);
}

#pragma mark - getter
- (ERichTextEditorView *)editorView {
    if (!_editorView) {
        _editorView = [[ERichTextEditorView alloc] initWithFrame:CGRectMake(0, STATUS_AND_NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_AND_NAVIGATION_HEIGHT - TAB_BAR_SAFE_BOTTOM_MARGIN - kFooterHeight)];
        _editorView.backgroundColor = [UIColor cyanColor];
    }
    return _editorView;
}

- (ContentEditFooterView *)footerView {
    if (!_footerView) {
        _footerView = [[ContentEditFooterView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TAB_BAR_SAFE_BOTTOM_MARGIN - kFooterHeight, SCREEN_WIDTH, kFooterHeight) editView:self.editorView];
        @weakify(self);
        _footerView.pictureBlock = ^{
            @strongify(self);
            [self.editorView recordCursorPosition];
            
            // 以下为测试代码，若从本地选择图片，请先传给后端拿到url，再依照以下步骤进行调用
            NSArray *imgUrls = @[
                                 @"http://img.i.cacf.cn/thread/1803/21/252d6546e6224c8b694a8d1918e62410.jpg",
                                 @"http://img.i.cacf.cn/thread/1803/21/1f061a159effab856007bb5e8466ad96.jpg",
                                 @"http://img1.imgtn.bdimg.com/it/u=397740769,1564679694&fm=200&gp=0.jpg",
                                 @"http://img0.imgtn.bdimg.com/it/u=4119238346,1821169886&fm=27&gp=0.jpg",
                                 @"http://img5.imgtn.bdimg.com/it/u=1858283759,2806224052&fm=200&gp=0.jpg",
                                 @"http://img0.imgtn.bdimg.com/it/u=2711668609,3709801299&fm=200&gp=0.jpg",
                                 @"http://img5.imgtn.bdimg.com/it/u=2239397734,1608218617&fm=27&gp=0.jpg"
                                 ];
            for (NSInteger i = imgUrls.count - 1; i >= 0; i --) {
                [self.editorView insertImage:imgUrls[i]];
            }
        };
        _footerView.tagBlock = ^{
        };
        
    }
    return _footerView;
}


@end
