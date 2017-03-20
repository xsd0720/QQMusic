//
//  QMBaseViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 17/3/2.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//


#import "QMBaseViewController.h"

@interface QMBaseViewController ()



@end

@implementation QMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}



- (void)setShowNav:(BOOL)showNav
{
    _showNav = showNav;
    if (showNav && !self.navView.superview) {
        self.navView = [[BETouchView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_AND_NAV_BAR_HEIGHT)];
        self.navView.backgroundColor = MAIN_TONE_COLOR;
        [self.view addSubview:self.navView];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
