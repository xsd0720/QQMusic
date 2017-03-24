//
//  QMPlayingView.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMPlayingView.h"
#import "BENoTouchView.h"
#import "AudioPlayManager.h"
@interface QMPlayingView()<AudioPlayManagerDelegate, BENoTouchViewDelegate>

@property (nonatomic, strong) UIView *profileHeaderView;
@property (nonatomic, strong) UILabel *songNameLabel;

@property (nonatomic, strong) UIImageView *albumImageView;

@property (nonatomic, strong) BENoTouchView *noTouchView;

@property (nonatomic, strong) AudioPlayManager *audioPlayManager;

@property (nonatomic, strong) CADisplayLink *audioPlayerDisplayLink;

@end

@implementation QMPlayingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        [self createProfileHeaderView];
        [self albumImageView];
        [self createAlbumView];
        [self createNoTouchView];
        
        self.audioPlayManager = [[AudioPlayManager alloc] init];
        self.audioPlayManager.delegate = self;

        
    }
    return self;
}


- (void)createProfileHeaderView
{
    
    _profileHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    [self addSubview:_profileHeaderView];
    
    _songNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    _songNameLabel.textAlignment = NSTextAlignmentCenter;
    _songNameLabel.font = [UIFont systemFontOfSize:14];
    _songNameLabel.textColor = [UIColor whiteColor];
    [self.profileHeaderView addSubview:_songNameLabel];
}

- (void)createAlbumView
{
    self.albumImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.profileHeaderView.frame)+10, 230, 230)];
    self.albumImageView.centerX = CGRectGetMaxX(self.bounds)/2;
    self.albumImageView.backgroundColor = [UIColor whiteColor];
    self.albumImageView.layer.cornerRadius = 230/2;
    self.albumImageView.clipsToBounds = YES;
    [self addSubview:self.albumImageView];
}

- (void)createNoTouchView
{
    CGFloat height = 220;
    self.noTouchView = [[BENoTouchView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-height, SCREEN_WIDTH, height)];
    self.noTouchView.clipsToBounds = YES;
    self.noTouchView.delegate = self;
    [self addSubview:self.noTouchView];
}


- (void)setSongInfoModel:(SongInfoModel *)songInfoModel
{
    _songInfoModel = songInfoModel;
    
    NSString *songName = songInfoModel.songName;
    NSString *songPicUrl = songInfoModel.songPicUrl;
    
    _songNameLabel.text = [NSString stringWithFormat:@"—   %@   —", songName];
    [self.albumImageView sd_setImageWithURL:[NSURL URLWithString:songPicUrl] placeholderImage:nil];
    [self.audioPlayManager preparePlayerWithURL:[NSURL URLWithString:songInfoModel.songUrl]];
}

- (void)BENoTouchViewShouldPlay
{
    [self.audioPlayerDisplayLink setPaused:NO];
    [self.audioPlayManager play];
}

- (void)BENoTouchViewShouldPause
{
    [self.audioPlayerDisplayLink setPaused:YES];
    [self.audioPlayManager pause];
}

- (void)prepareToPlay
{
    [self updatePlayProgressAndTimeLabelsValue];
    
    if (self.audioPlayerDisplayLink == nil) {
        self.audioPlayerDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updatePlayProgressAndTimeLabelsValue)];
        [self.audioPlayerDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        self.audioPlayerDisplayLink.paused = YES;
    }
}

- (void)updatePlayProgressAndTimeLabelsValue
{
    
    CMTime playerDuration = [self.audioPlayManager playerItemDuration];
    if (CMTIME_IS_INVALID(playerDuration))
    {
        [self.noTouchView updateDurationTimeLabel:@"00:00"];
        [self.noTouchView updateCurrentTimeLabel:@"00:00"];
        [self.noTouchView updateSliderValue:0];
        return;
    }
    
    double duration = CMTimeGetSeconds(playerDuration);
    if (isfinite(duration))
    {
        
        double time = CMTimeGetSeconds([self.audioPlayManager currentTime]);

        [self.noTouchView updateDurationTimeLabel:[self conversionSecondsToTime:duration]];
        [self.noTouchView updateCurrentTimeLabel:[self conversionSecondsToTime:MAX(time, 0)]];
        [self.noTouchView updateSliderValue:MAX(time, 0)/duration];
    }
}


/**
 *  秒转时间
 *
 *  @param time 时间(秒)
 *
 *  @return 转换后的时间*
 */
- (NSString *)conversionSecondsToTime:(double)time
{
    double minutesRemaining = floor(time / 60.0);
    double secondsRemaining = floor(fmod(time, 60.0));
    NSString *timeRmainingString = [NSString stringWithFormat:@"%02.0f:%02.0f", minutesRemaining, secondsRemaining];
    return timeRmainingString;
}

@end
