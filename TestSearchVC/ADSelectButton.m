//
//  ADSelectButton.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/7.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADSelectButton.h"
#import "UIButton+ADImagePosition.h"

@interface ADSelectButton ()
/// 是否是下拉状态
@property (nonatomic, assign, getter=isSelectedState) BOOL selectedState;
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
    [self setImage:[UIImage imageNamed:@"arrow_down_gray"] forState:UIControlStateNormal];
    [self ad_setImagePosition:ADImagePositionRight spacing:8];
}

#pragma mark - System Function

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    [super sendAction:action to:target forEvent:event];
    
    self.selectedState = !self.isSelectedState;
    [self rotate:M_PI animationKey:(self.isSelectedState ? @"rotationAnimation" : @"rotationZero")];
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    
    [super addTarget:target action:action forControlEvents:controlEvents];
}

#pragma mark - Private Function
- (void)rotate:(CGFloat)value animationKey:(NSString *)keyName {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:value];
    rotationAnimation.duration = 0.25;
//     rotationAnimation.cumulative = YES;
//     rotationAnimation.autoreverses = NO;
    
    // 防止动画结束回到原始位置
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.repeatCount = 1;//重复次数
    [self.imageView.layer addAnimation:rotationAnimation forKey:keyName];
}

@end
