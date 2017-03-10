//
//  QMAudioPlayerViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMAudioPlayerViewController.h"
#import "QMPlayingView.h"
#import "BETouchView.h"
#import "QMLandscapePlayingView.h"
#import "QMMiniPlayerController.h"
@interface QMAudioPlayerViewController ()

@property (nonatomic, strong) QMPlayingView *playingView;

@property (nonatomic, strong) UIView *shadeView;

@end

@implementation QMAudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.view.backgroundColor = [UIColor orangeColor];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
}



- (void)showPlayingView
{
//    QMMiniPlayerView *miniPlayerView = [[QMMiniPlayerController sharedMiniPlayerController] miniPlayerView];
//    [miniPlayerView pauseAlbumRotation];
//    UIImageView *albumImageView = [miniPlayerView playingSongAlbumImageView];
    
}


- (void)showPlayingViewAnimation
{
//    self.playingView.albumMode;
//    
//    [self setIsPlayingViewAnimating];
//    self.view;
    
    
    self.shadeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.shadeView setBackgroundColor:[UIColor clearColor]];
    
}

- (void)setIsPlayingViewAnimating
{
    
}

- (void)setShadeView:(UIView *)shadeView
{
    
}

- (void)shouldHideMiniplayerAlbumOnShowAnimation
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
