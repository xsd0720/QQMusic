//
//  QMAudioPlayerViewController.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMBaseViewController.h"

#define CURRENTALBUMVIEWTAG         101

@interface QMAudioPlayerViewController : QMBaseViewController

@property (nonatomic, strong) NSString *songName;

@property (nonatomic, strong) NSString *songURLStr;

@property (nonatomic, strong) NSString *picURLStr;

- (void)initAudioPlayerUIWhenInit;

- (void)showPlayingViewAnimation;
@end
