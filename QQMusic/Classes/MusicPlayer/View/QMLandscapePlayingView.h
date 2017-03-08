//
//  QMLandscapePlayingView.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMLandscapePlayingView : UIView

- (void)addBasicView;

- (void)addEntireView;

- (void)initEffectImageView;

- (void)initLyricView;

- (void)initGestureView;

- (void)initAdjustProgressView;

- (void)initTopOperateView;

- (void)initBottomOperateView;

- (void)initGestureGuideView;

- (void)removeEntireView;

- (void)playPreSong;

- (void)playOrPauseButtonPressed:(UIButton *)sender;

- (void)playNextSong;
@end
