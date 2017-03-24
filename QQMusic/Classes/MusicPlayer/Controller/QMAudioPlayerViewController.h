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

@property (nonatomic, strong) SongInfoModel *songInfoModel;

- (void)initAudioPlayerUIWhenInit;

- (void)showPlayingViewAnimation;
@end
