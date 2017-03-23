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
@interface QMPlayingView()

@property (nonatomic, strong) UIView *profileHeaderView;
@property (nonatomic, strong) UILabel *songNameLabel;

@property (nonatomic, strong) UIImageView *albumImageView;

@property (nonatomic, strong) BENoTouchView *noTouchView;

@property (nonatomic, strong) AudioPlayManager *audioPlayManager;

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
    self.albumImageView.layer.cornerRadius = 230/2;
    [self addSubview:self.albumImageView];
}

- (void)createNoTouchView
{
    CGFloat height = 220;
    self.noTouchView = [[BENoTouchView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-height, SCREEN_WIDTH, height)];
    self.noTouchView.clipsToBounds = YES;
    [self addSubview:self.noTouchView];
}


- (void)setDataSource:(NSDictionary *)dataSource
{
    _dataSource = dataSource;
    
    NSString *songName = dataSource[@"songName"];
    NSString *songPicUrl = dataSource[@"songPicUrl"];
    
    _songNameLabel.text = [NSString stringWithFormat:@"—   %@   —", songName];
    [self.albumImageView sd_setImageWithURL:[NSURL URLWithString:songPicUrl] placeholderImage:nil];
    [self.audioPlayManager preparePlayerWithURL:[NSURL URLWithString:dataSource[@"songUrl"]]];
}

@end
