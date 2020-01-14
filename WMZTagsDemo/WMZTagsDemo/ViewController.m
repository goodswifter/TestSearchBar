//
//  ViewController.m
//  WMZTagsDemo
//
//  Created by zhongaidong on 2020/1/14.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ViewController.h"
#import <TTGTagCollectionView.h>
#import "JSConditionTagView.h"

@interface ViewController () <TTGTagCollectionViewDelegate, TTGTagCollectionViewDataSource>
@property (weak, nonatomic) IBOutlet TTGTagCollectionView *tagCollectionView;

/// 数组
@property (nonatomic, strong) NSMutableArray *datas;
/// tag数组
@property (strong, nonatomic) NSMutableArray<UIView *> *tagViews;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tagCollectionView
    [self setupTagCollectionView];
    
    
    [self addTagViews];
}

#pragma mark - Private Function
- (void)addTagViews {
    NSInteger count = self.datas.count;
    for (int i = 0; i < count; i++) {
        JSConditionTagView *tagView = [JSConditionTagView sharedConditionTagView];
        tagView.autoresizingMask = UIViewAutoresizingNone;
        tagView.tagTitle = self.datas[i];
        [tagView sizeToFit];
        [self.tagViews addObject:tagView];
    }
    [self.tagCollectionView reload];
}

- (void)setupTagCollectionView {
    _tagCollectionView.delegate = self;
    _tagCollectionView.dataSource = self;
}

#pragma mark - Private Delegate
#pragma mark - <TTGTagCollectionViewDataSource>
- (NSUInteger)numberOfTagsInTagCollectionView:(TTGTagCollectionView *)tagCollectionView {
    return self.tagViews.count;
}

- (UIView *)tagCollectionView:(TTGTagCollectionView *)tagCollectionView tagViewForIndex:(NSUInteger)index {
    return self.tagViews[index];
}

#pragma mark - <TTGTagCollectionViewDelegate>
- (CGSize)tagCollectionView:(TTGTagCollectionView *)tagCollectionView sizeForTagAtIndex:(NSUInteger)index {
    return self.tagViews[index].frame.size;
}

- (void)tagCollectionView:(TTGTagCollectionView *)tagCollectionView didSelectTag:(UIView *)tagView atIndex:(NSUInteger)index {
    [self.tagViews removeObjectAtIndex:index];
    [self.datas removeObjectAtIndex:index];
    [self.tagCollectionView reload];
}

#pragma mark - Getter and Setter
- (NSMutableArray<UIView *> *)tagViews {
    if (!_tagViews) {
        _tagViews = [NSMutableArray array];
    }
    return _tagViews;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [@[@"asdfasdfas", @"阿斯顿发的", @"哈哈", @"阿达大", @"牛牛", @"牛牛", @"牛牛·妞儿·牛三", @"牛牛", @"牛牛", @"牛牛"] mutableCopy];
    }
    return _datas;
}

@end
