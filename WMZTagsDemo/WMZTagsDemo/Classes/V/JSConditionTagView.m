//
//  JSConditionTagView.m
//  WMZTagsDemo
//
//  Created by zhongaidong on 2020/1/14.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "JSConditionTagView.h"

#define padding 30
#define clearImgWidth 16

@interface JSConditionTagView ()
@property (weak, nonatomic) IBOutlet UILabel *tagTitleLbl;

@end

@implementation JSConditionTagView

+ (instancetype)sharedConditionTagView {
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
    self.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}

- (void)setTagTitle:(NSString *)tagTitle {
    _tagTitle = tagTitle;
    
    self.tagTitleLbl.text = tagTitle;
    [self.tagTitleLbl sizeToFit];
    
    CGFloat tagViewW = self.tagTitleLbl.frame.size.width + padding + clearImgWidth;
    
    self.tagViewSize = CGSizeMake(tagViewW, self.frame.size.height);
}

@end
