//
//  QMNavigationController.m
//  QQMusic
//
//  Created by xwmedia01 on 17/3/2.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMNavigationController.h"
#import "QMBaseViewController.h"
@interface QMNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation QMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    //添加手势管理
    self.interactivePopGestureRecognizer.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushViewController:(QMBaseViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    KEY_WINDOW.userInteractionEnabled = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        KEY_WINDOW.userInteractionEnabled = YES;
    });
    
    if (self.viewControllers.count >= 1) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *btn = [[UIButton alloc]initWithFrame:Rect(0, 0, 44, 40)];
        
        [btn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        
        btn.adjustsImageWhenHighlighted = NO;
        
        [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        viewController.showNav = YES;
        viewController.navView.leftView = btn;

        
    }
    [super pushViewController:viewController animated:YES];

}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)pop
{
    [self popViewControllerAnimated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
