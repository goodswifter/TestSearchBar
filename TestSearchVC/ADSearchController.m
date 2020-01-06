//
//  ADSearchController.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADSearchController.h"
#import "ADSearchTopView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ADSearchController ()

@end

@implementation ADSearchController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavBar];
}

- (void)setupNavBar {
    ADSearchTopView *titleView = [ADSearchTopView sharedSearcheTopView];
    
    // 取消
    titleView.cancelBlockTask = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 22, 44)];
    titleView.frame = backView.bounds;
    [backView addSubview:titleView];
    self.navigationItem.titleView = backView;
}

@end
