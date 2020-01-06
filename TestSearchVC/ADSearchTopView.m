//
//  ADSearchTopView.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADSearchTopView.h"

@interface ADSearchTopView ()

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
}

/// 取消
- (IBAction)cancelAction {
    !self.cancelBlockTask ?: self.cancelBlockTask();
}

@end
