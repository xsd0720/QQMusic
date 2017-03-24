//
//  AudioPlayManager.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "AudioPlayManager.h"

//播放状态
static void *AudioPlayerStatusObservationContext = &AudioPlayerStatusObservationContext;

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
    self.audioPlayer = [AVPlayer playerWithURL:URL];
    [self.audioPlayer.currentItem addObserver:self
                      forKeyPath:@"status"
                         options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                         context:AudioPlayerStatusObservationContext];

}

- (void)play
{
    [self.audioPlayer play];
}

- (void)pause
{
    [self.audioPlayer pause];
}


- (CMTime)currentTime
{
   return self.audioPlayer.currentTime;
}

- (CMTime)playerItemDuration
{
    return self.audioPlayer.currentItem.duration;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"audio play finish");
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    //status 发生改变
    if (context == AudioPlayerStatusObservationContext)
    {
        AVPlayerItemStatus status = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        switch (status)
        {
                
                //未知原因无法正常播放
            case AVPlayerItemStatusUnknown:
            {
                
            }
                break;
                
            case AVPlayerItemStatusReadyToPlay:
            {
                if (self.delegate && [self.delegate respondsToSelector:@selector(prepareToPlay)]) {
                    [self.delegate prepareToPlay];
                }
                
            }
                break;
                
            case AVPlayerItemStatusFailed:
            {

            }
                
                break;
        }
        
    }

}
@end
