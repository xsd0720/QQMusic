//
//  AudioPlayManager.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "AudioPlayManager.h"

@interface AudioPlayManager()<AVAudioPlayerDelegate>

@end

@implementation AudioPlayManager

+ (AudioPlayManager *)sharedAudioPlayManager
{
    static dispatch_once_t onceToken;
    static AudioPlayManager *shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[AudioPlayManager alloc] init];
    });
    return shareInstance;
}

- (void)preparePlayerWithURL:(NSURL *)URL
{
//    if (![URL isKindOfClass:[NSURL class]]) {
//        URL = [NSURL URLWithString:URL];
//    }
    NSError *error;
    
    
    self.audioPlayer = [AVPlayer playerWithURL:URL];
//    [self.audioPlayer play];
    //    self.audioPlayer = [[AVPlayer alloc] initWithContentsOfURL:URL error:&error];
//    self.audioPlayer.delegate = self;
//    self.audioPlayer.volume = 1;
//    //预播放
//    [self.audioPlayer prepareToPlay];
//    if (error) {
//        NSLog(@"%@", error);
//    }
    
}

- (void)play
{
    [self.audioPlayer play];
}

- (void)pause
{
    [self.audioPlayer pause];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"audio play finish");
}

@end
