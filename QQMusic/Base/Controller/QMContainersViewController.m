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
@interface QMContainersViewController ()<QMRootTopBarViewControllerDelegate, QMMiniPlayerViewDelegate>

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
    [self.view addSubview:self.rootTopBarViewController.view];
    [self addChildViewController:self.rootTopBarViewController];
    
    
    
    self.miniPlayerController = [[QMMiniPlayerController alloc] init];
    self.miniPlayerController.view.frame = CGRectMake(0, SCREEN_HEIGHT-55, SCREEN_WIDTH, 55);
    [self.view addSubview:self.miniPlayerController.view];
    self.miniPlayerController.miniDelegate = self;
    [self addChildViewController:self.miniPlayerController];
    
}

- (QMAudioPlayerViewController *)audioPlayerViewController
{
    if (!_audioPlayerViewController) {
        _audioPlayerViewController = [[QMAudioPlayerViewController alloc] init];
    }
    return _audioPlayerViewController;
}

- (BOOL)scrollOffsetXIsZero
{
    return [self.rootTopBarViewController scrollOffsetXIsZero];
}

- (void)showSliderMenuAction
{
    if (self.containersDelegate && [self.containersDelegate respondsToSelector:@selector(showSliderMenuAction)]) {
        [self.containersDelegate showSliderMenuAction];
    }
}

//- (void)addVCAsSubViewInVC:(id)arg2 inView:(id)arg3 subVC:(id)arg4
//{
//    [self addChildViewController:self.]
//}
- (void)showPlayingView
{
    [self showAudioPlayingView];
}

- (void)showAudioPlayingView
{
    UIButton *bb = [self.miniPlayerController.miniPlayerView playingSongAlbumImageView];
  CGRect r =   [self.audioPlayerViewController.view convertRect:bb.frame fromView:self.miniPlayerController.miniPlayerView];
    [bb setFrame:r];
    [self.view addSubview:self.audioPlayerViewController.view];
    [self.audioPlayerViewController.view addSubview:bb];
    [self addChildViewController:self.audioPlayerViewController];
    
    [self.view addSubview:self.audioPlayerViewController.view];
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
