//
//  ADSearchTopView.h
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADSearchTopView : UIView

+ (instancetype)sharedSearcheTopView;

/// 点击取消的任务
@property (nonatomic, copy) void(^cancelBlockTask)(void);

@end

NS_ASSUME_NONNULL_END
