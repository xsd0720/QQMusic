//
//  QMMainViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 17/3/2.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMainViewController.h"

#import "QMNavigationController.h"
#import "QMLeftMenuViewController.h"

#import "QMContainersViewController.h"

@interface QMMainViewController ()

@property (nonatomic, strong) QMLeftMenuViewController *leftMenuViewController;

@property (nonatomic, strong) QMContainersViewController *containersViewController;


@property (nonatomic, strong) UIView *navView;

@end

@implementation QMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpSubView];
    
}

- (void)setUpSubView
{
    self.leftMenuViewController = [[QMLeftMenuViewController alloc] init];
    self.leftMenuViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.leftMenuViewController.view];
    [self addChildViewController:self.leftMenuViewController];
    
    

    self.containersViewController = [[QMContainersViewController alloc] init];
    self.containersViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.containersViewController.view];
    [self addChildViewController:self.containersViewController];
}



- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    self.containersViewController.view.x = touchPoint.x;
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
