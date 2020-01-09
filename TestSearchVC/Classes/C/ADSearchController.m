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

@interface ADSearchController () <UITableViewDelegate, UIScrollViewDelegate>
/// topView
@property (nonatomic, weak) ADSearchTopView *topView;
/// 当前输入的文本
@property (nonatomic, copy) NSString *inputText;

/// 当前页面是否处于活跃状态
@property (nonatomic, assign, getter=isActive) BOOL active;
@end

@implementation ADSearchController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchTextFieldChange:) name:kTopViewSearchTextFieldEditingChanged object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.topView ad_becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.topView ad_endEditing];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupNavBar {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 22, 44)];
    self.topView.frame = backView.bounds;
    [backView addSubview:self.topView];
    self.navigationItem.titleView = backView;
}

#pragma mark - Notification Event Response
- (void)searchTextFieldChange:(NSNotification *)note {
    self.inputText = note.userInfo[@"text"];
    self.active = self.inputText.length;
    
    [self.tableView reloadData];
}

#pragma mark - System Delegate
#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isActive ? 50 : 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %ld", self.isActive ? @"非活跃" : @"活跃", indexPath.row];
    return cell;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY != -88 && offsetY != -64) {
        [self.topView ad_endEditing];
    }
}

#pragma mark - Getter and Setter
- (ADSearchTopView *)topView {
    if (!_topView) {
        ADSearchTopView *topView = [ADSearchTopView sharedSearcheTopView];
        
        // 取消
        topView.cancelBlockTask = ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        };
        _topView = topView;
    }
    return _topView;
}

@end
