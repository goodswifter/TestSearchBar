//
//  ADSelectButton.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/7.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADSelectButton.h"
#import "UIButton+ADImagePosition.h"
#import <FTPopOverMenu.h>

#define kRGBColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

@interface ADSelectButton ()
/// 是否是下拉状态
@property (nonatomic, assign, getter=isSelectedState) BOOL selectedState;
/// 数据源
@property (nonatomic, strong) NSArray *popMenus;
/// 配置信息
@property (nonatomic, strong) FTPopOverMenuConfiguration *configuration;
@end

@implementation ADSelectButton

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
    [self setImage:[UIImage imageNamed:@"arrow_down_black"] forState:UIControlStateNormal];
    [self ad_setImagePosition:ADImagePositionRight spacing:5];
}

#pragma mark - System Function

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    [super sendAction:action to:target forEvent:event];
    
    self.selectedState = !self.isSelectedState;
    
    [self showPopMenuButton];
}

#pragma mark - Private Function
- (void)rotate {
    [UIView animateWithDuration:0.25 animations:^{
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    }];
}

- (void)showPopMenuButton {
    [self rotate];
    [FTPopOverMenu showForSender:self withMenuArray:self.popMenus imageArray:nil configuration:self.configuration doneBlock:^(NSInteger selectedIndex) {
        NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
        [self setTitle:[self.popMenus[selectedIndex] title] forState:UIControlStateNormal];
        [self rotate];
    } dismissBlock:^{
        NSLog(@"user canceled. do nothing.");
        [self rotate];
    }];
}

#pragma mark - Getter and Setter
- (NSArray *)popMenus {
    if (!_popMenus) {
//        NSString *icomImageURLString = @"https://avatars1.githubusercontent.com/u/4414522?v=3&s=40";
//        NSURL *icomImageURL = [NSURL URLWithString:icomImageURLString];
        
        FTPopOverMenuModel *model1 = [[FTPopOverMenuModel alloc] initWithTitle:@"租房" image:nil selected:YES];
        FTPopOverMenuModel *model2 = [[FTPopOverMenuModel alloc] initWithTitle:@"民宿" image:nil selected:NO];
        
        _popMenus = @[model1, model2];;
    }
    return _popMenus;
}

- configuration {
    if (!_configuration) {
        FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
        configuration.selectedTextColor = [UIColor orangeColor];
        configuration.backgroundColor = [UIColor whiteColor];
        configuration.shadowColor = [UIColor yellowColor];
        configuration.shadowOffsetX = 10;
        configuration.shadowOffsetY = 10;
        configuration.menuRowHeight = 44;
        configuration.borderColor = kRGBColor(188, 188, 188);
        configuration.separatorColor = kRGBColor(188, 188, 188);
//        configuration.coverBackgroundColor = [UIColor orangeColor];
//        configuration.menuWidth = 120;
        configuration.textColor = [UIColor blackColor];
        configuration.textFont = [UIFont boldSystemFontOfSize:18];
//        configuration.borderColor = [UIColor blackColor];
//        configuration.selectedCellBackgroundColor = [UIColor whiteColor];
        configuration.borderWidth = 0.5;
        configuration.textAlignment = NSTextAlignmentCenter;
        configuration.ignoreImageOriginalColor = YES; // set 'ignoreImageOriginalColor' to YES, images color will be same as textColor
        _configuration = configuration;
    }
    return _configuration;
}

@end
