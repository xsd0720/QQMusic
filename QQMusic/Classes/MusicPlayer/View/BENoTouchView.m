//
//  BENoTouchView.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/14.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "BENoTouchView.h"
#import "QMPlaySlider.h"
@interface BENoTouchView()<QMPlaySliderDelegate>

//time show
@property (nonatomic, strong) UILabel *currentTimeLabel;
@property (nonatomic, strong) UILabel *durationTimeLabel;
@property (nonatomic, strong) QMPlaySlider *playSlider;

@property (nonatomic, strong) UIButton *playModeButton;
@property (nonatomic, strong) UIButton *preButton;
@property (nonatomic, strong) UIButton *playPauseButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *playListButton;

@end

@implementation BENoTouchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTimeShow];
        
        [self createPlayControlShow];
    
    }
    return self;
}

- (void)createTimeShow
{
    CGFloat timeLabelWidth = 50;
    
    self.currentTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, timeLabelWidth, 20)];
    self.currentTimeLabel.text = @"00:00";
    self.currentTimeLabel.textAlignment = NSTextAlignmentCenter;
    self.currentTimeLabel.font = [UIFont systemFontOfSize:12];
    self.currentTimeLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.75];
    [self addSubview:self.currentTimeLabel];
    
    self.playSlider = [[QMPlaySlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.currentTimeLabel.frame), 0, CGRectGetMaxX(self.bounds)-2*timeLabelWidth, 20) supportCache:YES];
    self.playSlider.minimumTrackTintColor = RGB(111, 196, 141);
    self.playSlider.maximumTrackTintColor = [RGB(157, 152, 149) colorWithAlphaComponent:0.5];
    self.playSlider.cacheimumTrackTintColor = [RGB(117, 120, 117) colorWithAlphaComponent:0.5];
    [self.playSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
    [self.playSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateHighlighted];
    self.playSlider.delegate = self;
    [self addSubview:self.playSlider];
    
    
    self.durationTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bounds)-timeLabelWidth, 0, timeLabelWidth, 20)];
    self.durationTimeLabel.font = [UIFont systemFontOfSize:12];
    self.durationTimeLabel.textAlignment = NSTextAlignmentCenter;
    self.durationTimeLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.75];
    self.durationTimeLabel.text = @"00:00";
    [self addSubview:self.durationTimeLabel];
    
}

- (void)createPlayControlShow
{
    CGFloat centerY = 60;
    CGFloat padding = 5;
    
    CGFloat oneSize = 40;
    CGFloat twoSize = 50;
    CGFloat threeSize = 60;
    
    CGFloat button_padding = (CGRectGetMaxX(self.bounds)-(oneSize+twoSize+threeSize+twoSize+oneSize)-2*padding)/4;
    
    self.playModeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playModeButton setImage:[UIImage imageNamed:@"player_btn_random_normal"] forState:UIControlStateNormal];
    [self.playModeButton setImage:[UIImage imageNamed:@"player_btn_random_hightlight"] forState:UIControlStateHighlighted];
    self.playModeButton.frame = CGRectMake(padding, 0, oneSize, oneSize);
    [self addSubview:self.playModeButton];
    
    
    self.preButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.preButton setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
    [self.preButton setImage:[UIImage imageNamed:@"player_btn_pre_hightlight"] forState:UIControlStateHighlighted];
    self.preButton.frame = CGRectMake(CGRectGetMaxX(self.playModeButton.frame)+button_padding, 0, twoSize, twoSize);
    [self addSubview:self.preButton];
    
    
    self.playPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playPauseButton setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
    [self.playPauseButton setImage:[UIImage imageNamed:@"player_btn_play_highlight"] forState:UIControlStateHighlighted];
    self.playPauseButton.frame = CGRectMake(CGRectGetMaxX(self.preButton.frame)+button_padding, 0, threeSize, threeSize);
    [self addSubview:self.playPauseButton];
    
    
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:UIControlStateNormal];
    [self.nextButton setImage:[UIImage imageNamed:@"player_btn_next_hightlight"] forState:UIControlStateHighlighted];
    self.nextButton.frame = CGRectMake(CGRectGetMaxX(self.playPauseButton.frame)+button_padding, 0, twoSize, twoSize);
    [self addSubview:self.nextButton];
    
    
    self.playListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playListButton setImage:[UIImage imageNamed:@"player_btn_playlist_normal"] forState:UIControlStateNormal];
    [self.playListButton setImage:[UIImage imageNamed:@"player_btn_playlist_highlight"] forState:UIControlStateHighlighted];
    self.playListButton.frame = CGRectMake(CGRectGetMaxX(self.nextButton.frame)+button_padding, 0, oneSize, oneSize);
    [self addSubview:self.playListButton];
    
    
    
    self.playModeButton.centerY = centerY;
    self.preButton.centerY = centerY;
    self.playPauseButton.centerY = centerY;
    self.nextButton.centerY = centerY;
    self.playListButton.centerY = centerY;
}

- (void)thumbTouchesBegan
{
    self.currentTimeLabel.font = [UIFont systemFontOfSize:15];
}

- (void)thumbTouchesEnded
{
     self.currentTimeLabel.font = [UIFont systemFontOfSize:12];
}


@end
