//
//  AudioPlayManager.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface AudioPlayManager : NSObject

@property (nonatomic, strong) AVPlayer *audioPlayer;

+ (AudioPlayManager *)sharedAudioPlayManager;

- (void)preparePlayerWithURL:(NSURL *)URL;

- (void)play;

- (void)pause;

- (void)finish;

@end
