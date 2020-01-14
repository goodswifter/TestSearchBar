//
//  JSConditionTagView.m
//  WMZTagsDemo
//
//  Created by zhongaidong on 2020/1/14.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "JSConditionTagView.h"

@interface JSConditionTagView ()
@property (weak, nonatomic) IBOutlet UILabel *tagTitleLbl;

@end

@implementation JSConditionTagView

+ (instancetype)sharedConditionTagView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)setTagTitle:(NSString *)tagTitle {
    _tagTitle = tagTitle;
    
    self.tagTitleLbl.text = tagTitle;
    [self.tagTitleLbl sizeToFit];
}

@end
