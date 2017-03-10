//
//  AudioPlayManager.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "AudioPlayManager.h"

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

@end
