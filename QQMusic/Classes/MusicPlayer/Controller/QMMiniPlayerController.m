//
//  QMMiniPlayerController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMiniPlayerController.h"
#import "AudioPlayManager.h"
#import "QMAudioPlayerViewController.h"
@interface QMMiniPlayerController ()<QMMiniPlayerViewDelegate>



@property (nonatomic, strong) QMAudioPlayerViewController *audioPlayViewController;

@end

@implementation QMMiniPlayerController


+ (instancetype)sharedMiniPlayerController
{
    static dispatch_once_t onceToken;
    static QMMiniPlayerController *shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[QMMiniPlayerController alloc] init];
    });
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.miniPlayerView = [[QMMiniPlayerView alloc] initWithFrame:self.view.bounds];
    self.miniPlayerView.playingDelegate = self;
    [self.view addSubview:self.miniPlayerView];
    
}

- (void)showPlayingView
{
//    [self delayShowPlayingView];
    if (self.miniDelegate && [self.miniDelegate respondsToSelector:@selector(showPlayingView)]) {
        [self.miniDelegate showPlayingView];
    }
    
}

- (void)delayShowPlayingView
{
    [self miniPlayerShowPlayingView];
}

- (void)miniPlayerShowPlayingView
{
    self.audioPlayViewController = [[QMAudioPlayerViewController alloc] init];
    [self.audioPlayViewController showPlayingView];
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
