//
//  JSConditionTagView.h
//  WMZTagsDemo
//
//  Created by zhongaidong on 2020/1/14.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSConditionTagView : UIView

/// 标签标题
@property (nonatomic, copy) NSString *tagTitle;

+ (instancetype)sharedConditionTagView;

@end
 
NS_ASSUME_NONNULL_END
