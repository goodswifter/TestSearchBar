//
//  ViewController.m
//  TestSearchVC
//
//  Created by zhongaidong on 2020/1/6.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ViewController.h"
#import "ADSearchController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ADSearchController *searchVc = [[ADSearchController alloc] init];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:searchVc];
    navVc.navigationBar.barTintColor = [UIColor whiteColor];
    
    CATransition *animation = [CATransition animation];

    animation.duration = 0.5;    //  时间

    /**  type：动画类型
      *  pageCurl       向上翻一页
      *  pageUnCurl     向下翻一页
      *  rippleEffect   水滴
      *  suckEffect     收缩
      *  cube           方块
      *  oglFlip        上下翻转
      */
    animation.type = @"rippleEffect";

     /**  type：页面转换类型
      *  kCATransitionFade       淡出
      *  kCATransitionMoveIn     覆盖
      *  kCATransitionReveal     底部显示
      *  kCATransitionPush       推出
      */
//    animation.type = kCATransitionFade;

    //PS：type 更多效果请 搜索： CATransition

    /**  subtype：出现的方向
      *  kCATransitionFromRight       右
      *  kCATransitionFromLeft        左
      *  kCATransitionFromTop         上
      *  kCATransitionFromBottom      下
      */
    animation.subtype = kCATransitionFromTop;

    [self.view.window.layer addAnimation:animation forKey:nil];
    
    [self.navigationController pushViewController:searchVc animated:YES];
    
    /**
     UIModalPresentationFullScreen = 0,
     UIModalPresentationPageSheet API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos),
     UIModalPresentationFormSheet API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos),
     UIModalPresentationCurrentContext API_AVAILABLE(ios(3.2)),
     UIModalPresentationCustom API_AVAILABLE(ios(7.0)),
     UIModalPresentationOverFullScreen API_AVAILABLE(ios(8.0)),
     UIModalPresentationOverCurrentContext API_AVAILABLE(ios(8.0)),
     UIModalPresentationPopover API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(tvos),
     UIModalPresentationBlurOverFullScreen API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios) API_UNAVAILABLE(watchos),
     UIModalPresentationNone API_AVAILABLE(ios(7.0)) = -1,
     UIModalPresentationAutomatic API_AVAILABLE(ios(13.0)) = -2,
     */
    
//    navVc.modalPresentationStyle = UIModalPresentationFullScreen;
    /**
     UIModalTransitionStyleCoverVertical = 0,
     UIModalTransitionStyleFlipHorizontal API_UNAVAILABLE(tvos),
     UIModalTransitionStyleCrossDissolve,
     UIModalTransitionStylePartialCurl API_AVAILABLE(ios(3.2))
     */
    
//    navVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:navVc animated:YES completion:nil];
}


@end
