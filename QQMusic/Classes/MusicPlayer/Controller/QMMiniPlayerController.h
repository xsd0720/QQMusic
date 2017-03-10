//
//  QMMiniPlayerController.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMBaseViewController.h"
#import "QMMiniPlayerView.h"

@protocol QMMiniPlayerControllerDelegate <NSObject>

- (void)showPlayingView;

@end

@interface QMMiniPlayerController : QMBaseViewController

@property (nonatomic, strong) QMMiniPlayerView *miniPlayerView;

@property (nonatomic, strong) id<QMMiniPlayerControllerDelegate> miniDelegate;

+ (instancetype)sharedMiniPlayerController;

@end
