//
//  ADSearchTopView.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADSearchTopView.h"
#import "ADSelectButton.h"

#define kRGBColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

@interface ADSearchTopView ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation ADSearchTopView

+ (instancetype)sharedSearcheTopView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 初始化
    [self setup];
}

#pragma mark - 初始化
- (void)setup {
    self.autoresizingMask = UIViewAutoresizingNone;
    UISearchTextField *searchField = [self.searchBar valueForKey:@"searchField"];
    // 设置光标颜色
    searchField.tintColor = [UIColor blueColor];
    
    // 设置背景颜色
    searchField.backgroundColor = kRGBColor(244, 245, 246);
    
    // 去掉左边搜索图标
    searchField.leftViewMode = UITextFieldViewModeNever;
    
    // 设置清除按钮
//    [self.searchBar setImage:<#(nullable UIImage *)#> forSearchBarIcon:<#(UISearchBarIcon)#> state:<#(UIControlState)#>];
    
    self.searchBar.showsCancelButton = NO;
    // 设置光标偏移
    self.searchBar.searchTextPositionAdjustment = UIOffsetMake(60, 0);
}

/// 取消
- (IBAction)cancelAction {
    !self.cancelBlockTask ?: self.cancelBlockTask();
}
- (IBAction)selectTypeAction:(ADSelectButton *)sender {
    NSLog(@"444");
}

@end
