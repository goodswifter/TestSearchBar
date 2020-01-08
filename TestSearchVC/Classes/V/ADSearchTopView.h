//
//  ADSearchTopView.h
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTopViewSearchTextFieldEditingChanged @"TopViewSearchTextFieldEditingChanged"

NS_ASSUME_NONNULL_BEGIN

@interface ADSearchTopView : UIView

+ (instancetype)sharedSearcheTopView;

/// 是否处于活跃状态
@property (nonatomic, assign, getter=isActive) BOOL active;
/// 点击取消的任务
@property (nonatomic, copy) void(^cancelBlockTask)(void);

- (void)ad_becomeFirstResponder;
- (void)ad_endEditing;

@end

NS_ASSUME_NONNULL_END
