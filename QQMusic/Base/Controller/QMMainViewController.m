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

#import "QMMiniPlayerController.h"

#import "QMDataSourceTool.h"


@interface QMMainViewController ()<UIGestureRecognizerDelegate, QMContainersViewControllerDelegate>

@property (nonatomic, strong) QMLeftMenuViewController *leftMenuViewController;

@property (nonatomic, strong) QMContainersViewController *containersViewController;

@property (nonatomic, strong) UIView *navView;

@property (nonatomic) UIPanGestureRecognizer *showMenuPanGesture;

@property (nonatomic) UIControl *lockContainerView;

@end

@implementation QMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    self.containersViewController.containersDelegate = self;
    [self.view addSubview:self.containersViewController.view];
    [self addChildViewController:self.containersViewController];
    
    
    self.showMenuPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(showMenuPanGestureAction:)];
    self.showMenuPanGesture.delegate = self;
    [self.view addGestureRecognizer:self.showMenuPanGesture];
    
    
    self.lockContainerView = [[UIControl alloc] initWithFrame:self.view.bounds];
    [self.lockContainerView addTarget:self action:@selector(showSliderMenuAction) forControlEvents:UIControlEventTouchUpInside];
    self.lockContainerView.userInteractionEnabled = NO;
    self.lockContainerView.backgroundColor = [UIColor blackColor];
    self.lockContainerView.layer.opacity = 0;
    [self.containersViewController.view addSubview:self.lockContainerView];
    
    self.leftMenuViewController.view.x = -MENUMAXSHOWWIDTH/2;
    
    
    
}
//保证拖动手势和UIScrollView上的拖动手势互不影响
-(BOOL)gestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer
{
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return NO;
    }
    if (self.containersViewController.view.x == MENUMAXSHOWWIDTH) {
        return YES;
    }
    
    CGPoint tranPoint = [gestureRecognizer translationInView:self.view];

    if ([self.containersViewController scrollOffsetXIsZero] && tranPoint.x > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (void)showMenuPanGestureAction:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translationPoint = [panGestureRecognizer translationInView:self.view];
    CGPoint velocityPoint = [panGestureRecognizer velocityInView:self.view];

    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
   
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        self.containersViewController.view.x += translationPoint.x;
        if (self.containersViewController.view.x >= MENUMAXSHOWWIDTH) {
            self.containersViewController.view.x = MENUMAXSHOWWIDTH;
        }
        if (self.containersViewController.view.x <=0) {
            self.containersViewController.view.x = 0;
        }

        self.leftMenuViewController.view.x = -MENUMAXSHOWWIDTH/2 + self.containersViewController.view.x/2;
        self.lockContainerView.layer.opacity = 0.3 * self.containersViewController.view.x/MENUMAXSHOWWIDTH;
        
        [panGestureRecognizer setTranslation:CGPointZero inView:self.view];
        
    }
    else
    {
        [self fixMenuAndMainContainer:velocityPoint];
       
    }
}

- (void)fixMenuAndMainContainer:(CGPoint)velocityPoint
{

    if (self.containersViewController.view.layer.animationKeys.count > 0) {
        return;
    }
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat containerOrginX = self.containersViewController.view.x;
        if (fabs(velocityPoint.x) < 250) {
            if (containerOrginX <= MENUMAXSHOWWIDTH/2) {
                self.containersViewController.view.x = 0;
                self.lockContainerView.userInteractionEnabled = NO;
            }
            else
            {
                self.containersViewController.view.x = MENUMAXSHOWWIDTH;
                self.lockContainerView.userInteractionEnabled = YES;
            }
        }else
        {
            if (velocityPoint.x < 0) {
                self.containersViewController.view.x = 0;
                self.lockContainerView.userInteractionEnabled = NO;
            }else
            {
                self.containersViewController.view.x = MENUMAXSHOWWIDTH;
                self.lockContainerView.userInteractionEnabled = YES;
            }
        }
        

        self.leftMenuViewController.view.x = -MENUMAXSHOWWIDTH/2 + self.containersViewController.view.x/2;
        self.lockContainerView.layer.opacity = 0.3 * self.containersViewController.view.x/MENUMAXSHOWWIDTH;
        
        [self setNeedsStatusBarAppearanceUpdate];
    }];
  
}


- (void)showSliderMenuAction
{
    if (self.containersViewController.view.x == MENUMAXSHOWWIDTH) {
        [self fixMenuAndMainContainer:CGPointMake(-500, 0)];
    }
    else
    {
        [self fixMenuAndMainContainer:CGPointMake(500, 0)];
    }
}

- (void)musichallAction
{


}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (self.containersViewController.view.x == 0) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
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
