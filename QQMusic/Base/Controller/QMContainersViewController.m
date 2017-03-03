//
//  QMContainersViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMContainersViewController.h"

#import "QMMineViewController.h"
#import "QMMusicLibraryViewController.h"

@interface ContainerScollView : UIScrollView

@end

@implementation ContainerScollView


@end


@interface QMContainersViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *navView;

@property (nonatomic, strong) ContainerScollView *mainScrollView;

@property (nonatomic, strong) QMMineViewController *mineViewController;
@property (nonatomic, strong) QMMusicLibraryViewController *musicLibraryController;

@property (nonatomic, strong) UIPanGestureRecognizer *showMenuPanGesture;


@end

@implementation QMContainersViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNav];
    [self setUpSubView];
    
}

- (void)setUpNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_AND_NAV_BAR_HEIGHT)];
    self.navView.backgroundColor = MAIN_TONE_COLOR;
    [self.view addSubview:self.navView];
}

- (void)setUpSubView
{
    self.mainScrollView = [[ContainerScollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame), CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds)-CGRectGetMaxY(self.navView.frame))];
    self.mainScrollView.contentSize = CGSizeMake(CGRectGetMaxX(self.view.bounds)*2, 0);
    self.mainScrollView.pagingEnabled = YES;
    [self.view addSubview:self.mainScrollView];
    
    
    self.mineViewController = [[QMMineViewController alloc] init];
    [self addChildViewController:self.mineViewController];
    self.mineViewController.view.frame = self.mainScrollView.bounds;
    [self.mainScrollView addSubview:self.mineViewController.view];
    
    self.showMenuPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(showMenuPanGestureAction:)];
    [self.mineViewController.view addGestureRecognizer:self.showMenuPanGesture];
    
    
    self.musicLibraryController = [[QMMusicLibraryViewController alloc] init];
    [self addChildViewController:self.musicLibraryController];
    self.musicLibraryController.view.frame = self.mainScrollView.bounds;
    self.musicLibraryController.view.x = CGRectGetMaxX(self.view.bounds);
    [self.mainScrollView addSubview:self.musicLibraryController.view];
}


- (void)showMenuPanGestureAction:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint locationPoint = [panGestureRecognizer locationInView:self.view.superview];
     CGPoint tranPoint = [panGestureRecognizer translationInView:self.view.superview];
  
//    NSLog(@"%@", NSStringFromCGPoint(tranPoint));
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        if (self.mainScrollView.contentOffset.x <=0 && locationPoint.x < 300) {
            self.view.x = locationPoint.x;
        }
    }
    
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        if (self.mainScrollView.contentOffset.x <=0 && locationPoint.x < 300) {
            self.view.x = locationPoint.x;
        }
    }
    else
    {
        if (self.view.x <=150) {
            [UIView animateWithDuration:0.1 animations:^{
                      self.view.x = 0;
            }];
      
        }else
        {
            [UIView animateWithDuration:0.1 animations:^{
                 self.view.x = 300;
            }];
           
        }
    }
    
   
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
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
