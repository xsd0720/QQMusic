//
//  QMContainersViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMContainersViewController.h"
#import "QMRootTopBarViewController.h"
#import "QMMiniPlayerController.h"
#import "QMAudioPlayerViewController.h"
@interface QMContainersViewController ()<QMRootTopBarViewControllerDelegate, QMMiniPlayerControllerDelegate, QMRootTopBarViewControllerDelegate>

@property (nonatomic, strong) QMRootTopBarViewController *rootTopBarViewController;

@property (nonatomic, strong) QMMiniPlayerController *miniPlayerController;

@property (nonatomic, strong) QMAudioPlayerViewController *audioPlayerViewController;

@end

@implementation QMContainersViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpSubView];
    
}

- (void)setUpSubView
{
    self.rootTopBarViewController = [[QMRootTopBarViewController alloc] init];
    self.rootTopBarViewController.view.frame = self.view.bounds;
    self.rootTopBarViewController.rootTopBarDelegate = self;
    [self.view addSubview:self.rootTopBarViewController.view];
    [self addChildViewController:self.rootTopBarViewController];
    
    
    self.miniPlayerController = [[QMMiniPlayerController alloc] init];
    self.miniPlayerController.view.frame = CGRectMake(0, SCREEN_HEIGHT-55, SCREEN_WIDTH, 55);
    [self.view addSubview:self.miniPlayerController.view];
    self.miniPlayerController.miniDelegate = self;
    [self addChildViewController:self.miniPlayerController];
    
}

- (BOOL)scrollOffsetXIsZero
{
    return [self.rootTopBarViewController scrollOffsetXIsZero];
}

//SHOW SLIDER MENU
- (void)showSliderMenuAction
{
    if (self.containersDelegate && [self.containersDelegate respondsToSelector:@selector(showSliderMenuAction)]) {
        [self.containersDelegate showSliderMenuAction];
    }
}

- (void)musichallAction
{
    if (self.containersDelegate && [self.containersDelegate respondsToSelector:@selector(musichallAction)]) {
        [self.containersDelegate musichallAction];
    }
}

- (void)miniPlayControllerTouchEndAction
{

    self.audioPlayerViewController = [[QMAudioPlayerViewController alloc] init];
    
    [self presentViewController:self.audioPlayerViewController animated:YES completion:nil];
    
//    [self.view addSubview:self.audioPlayerViewController.view];
//    [self addChildViewController:self.audioPlayerViewController];
//    
//    
//    UIImageView *currentAlbumImageView = [self.miniPlayerController playingSongAlbumImageView];
//    if (!currentAlbumImageView) {
//        return;
//    }
//    CGRect willShowRect = [self.audioPlayerViewController.view convertRect:currentAlbumImageView.frame fromView:self.miniPlayerController.miniPlayerView];
//    currentAlbumImageView.tag = 101;
//    [currentAlbumImageView setFrame:willShowRect];
//    [self.audioPlayerViewController.view addSubview:currentAlbumImageView];
//    
//    
//    [self.audioPlayerViewController showPlayingViewAnimation];
    
    
    
//    //start animation

 
    //    //透明度变化
//    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnimation.fromValue = [NSNumber numberWithFloat:0];
//    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    opacityAnimation.duration = 0.3f;
//    opacityAnimation.autoreverses = NO;   //是否重播，原动画的倒播
//    [self.audioPlayerViewController.view.layer addAnimation:opacityAnimation forKey:@"opcity"];
    
    
//    //位置移动
//    CABasicAnimation *positionAnimation  = [CABasicAnimation animationWithKeyPath:@"position"];
//    positionAnimation.fromValue =  [NSValue valueWithCGPoint: currentAlbumImageView.layer.position];
//    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, 100)];
//    
//    //缩放动画
//    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    scaleAnimation.toValue = [NSNumber numberWithFloat:8.0];
//    scaleAnimation.duration = 0.3f;
//    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    
//    //组合动画
//    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//    animationGroup.duration = 0.3f;
//    animationGroup.autoreverses = NO;   //是否重播，原动画的倒播
//    animationGroup.repeatCount = NSNotFound;//HUGE_VALF;	 //HUGE_VALF,源自math.h
//    [animationGroup setAnimations:[NSArray arrayWithObjects:positionAnimation, scaleAnimation, nil]];
//    [currentAlbumImageView.layer addAnimation:animationGroup forKey:@"group"];
}


- (void)dismissAudioPlayingView
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
