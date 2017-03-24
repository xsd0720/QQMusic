//
//  AudioPlayManager.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@class AudioPlayManager;

@protocol AudioPlayManagerDelegate <NSObject>

- (void)prepareToPlay;

@end

@interface AudioPlayManager : NSObject

@property (nonatomic, assign) id<AudioPlayManagerDelegate> delegate;

@property (nonatomic, strong) AVPlayer *audioPlayer;

+ (AudioPlayManager *)sharedAudioPlayManager;

- (void)preparePlayerWithURL:(NSURL *)URL;

- (void)play;

- (void)pause;

- (void)finish;

- (CMTime)playerItemDuration;

- (CMTime)currentTime;


@end
