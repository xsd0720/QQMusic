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
#import "BETouchView.h"
#import "AutoScrollLabel.h"
@interface QMAudioPlayerViewController ()

@property (nonatomic, strong) QMPlayingView *playingView;

@property (nonatomic, strong) BETouchView *beTouchView;

@property (nonatomic, strong) AutoScrollLabel *autoScrollLabel;

@end

@implementation QMAudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpNav];
    
    [self setUpSubview];
    
    [self setUpDataSource];

}

- (void)setUpNav
{
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissButton.frame = CGRectMake(0, 0, 60, 44);
    [dismissButton setImage:[UIImage imageNamed:@"player_btn_close_normal"] forState:UIControlStateNormal];
    [dismissButton setImage:[UIImage imageNamed:@"player_btn_close_hightlight"] forState:UIControlStateHighlighted];
    [dismissButton addTarget:self action:@selector(dismissButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(0, 0, 60, 44);
    [moreButton setImage:[UIImage imageNamed:@"player_btn_more_normal"] forState:UIControlStateNormal];
    [moreButton setImage:[UIImage imageNamed:@"player_btn_more_highlight"] forState:UIControlStateHighlighted];
    [moreButton addTarget:self action:@selector(moreButtonButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.autoScrollLabel = [[AutoScrollLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    self.autoScrollLabel.font = [UIFont systemFontOfSize:19];
    self.autoScrollLabel.textColor = [UIColor whiteColor];
    
    
    self.beTouchView = [[BETouchView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_AND_NAV_BAR_HEIGHT)];
    self.beTouchView.leftView = dismissButton;
    self.beTouchView.rightView = moreButton;
    self.beTouchView.centerView = self.autoScrollLabel;
    [self.view addSubview:self.beTouchView];
}


- (void)setUpSubview
{
    self.playingView = [[QMPlayingView alloc] initWithFrame:CGRectMake(0, STATUS_AND_NAV_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_AND_NAV_BAR_HEIGHT)];
    [self.view addSubview:self.playingView];
}


- (void)setUpDataSource
{
    self.autoScrollLabel.text = self.songName;
    if (self.songName) {
        NSDictionary *datasource = @{@"songName":self.songName, @"songPicUrl":self.picURLStr, @"songUrl":self.songURLStr};
        self.playingView.dataSource = datasource;
    }

}

- (void)dismissButtonPressed
{
    [self.autoScrollLabel dismiss];
    [self dismissViewControllerAnimated:self completion:nil];
}

- (void)moreButtonButtonPressed
{
    
}

- (void)showPlayingViewAnimation
{
//    _bgImageView.alpha = 0;
//    [UIView animateWithDuration:0.3f animations:^{
//        _bgImageView.alpha = 1;
//    } completion:^(BOOL finished) {
//        self.view.backgroundColor = [UIColor whiteColor];
//    }];

//    UIView *currentAlbumImageView = [self.view viewWithTag:CURRENTALBUMVIEWTAG];
//    //透明度变化
//    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnimation.fromValue = [NSNumber numberWithFloat:0];
//    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    opacityAnimation.duration = 0.3f;
//    opacityAnimation.autoreverses = NO;   //是否重播，原动画的倒播
//    [self.bgImageView.layer addAnimation:opacityAnimation forKey:@"bgImage_Opacity"];

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
