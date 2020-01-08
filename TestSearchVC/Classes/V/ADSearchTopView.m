//
//  ADSearchTopView.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADSearchTopView.h"
#import "ADSelectButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kRGBColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

@interface ADSearchTopView ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *bgView;
/// searchbar的textfield
@property (nonatomic, weak) UISearchTextField *searchTF;
@end

@implementation ADSearchTopView

+ (instancetype)sharedSearcheTopView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
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
    self.searchTF = searchField;
    // 设置光标颜色
    searchField.tintColor = [UIColor orangeColor];
    
    // 设置背景颜色
    searchField.backgroundColor = kRGBColor(244, 245, 246);
    
    // 去掉左边搜索图标
    searchField.leftViewMode = UITextFieldViewModeNever;
    
    // 设置清除按钮
//    [self.searchBar setImage:<#(nullable UIImage *)#> forSearchBarIcon:<#(UISearchBarIcon)#> state:<#(UIControlState)#>];
    
    self.searchBar.showsCancelButton = NO;
    // 设置光标偏移
    self.searchBar.searchTextPositionAdjustment = UIOffsetMake(60, 0);

//    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self.searchTF userInfo:@{@"text" : @"1234"}];
//    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:@{@"text" : @"1234"}];
    
    [self.searchTF addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Private Function
- (void)textFieldTextChange:(UISearchTextField *)searchTF {
    [[NSNotificationCenter defaultCenter] postNotificationName:kTopViewSearchTextFieldEditingChanged object:@{@"text" : searchTF.text}];
}

#pragma mark - Public Function
- (void)ad_becomeFirstResponder {
    [self.searchBar becomeFirstResponder];
}

- (void)ad_endEditing {
    [self endEditing:YES];
}

#pragma mark - Button Event Response
/// 取消
- (IBAction)cancelAction {
    !self.cancelBlockTask ?: self.cancelBlockTask();
}

- (IBAction)selectTypeAction:(ADSelectButton *)sender {
    NSLog(@"444");
}

#pragma mark - Getter and Setter
- (BOOL)isActive {
    return self.searchTF.text.length;
}

@end
