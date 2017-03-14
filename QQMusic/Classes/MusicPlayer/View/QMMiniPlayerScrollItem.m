//
//  QMMiniPlayerScrollItem.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/13.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMiniPlayerScrollItem.h"

@implementation QMMiniPlayerScrollItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        
        self.albumImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.albumImageView];
        
        self.songTitleLabel = [[UITextView alloc] initWithFrame:CGRectZero];
        self.songTitleLabel.editable = NO;
        self.songTitleLabel.font = [UIFont systemFontOfSize:14];
        self.songTitleLabel.selectable = NO;
        self.songTitleLabel.layer.masksToBounds = YES;
        self.songTitleLabel.userInteractionEnabled = NO;
        [self addSubview:self.songTitleLabel];
        
        self.lyricLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.lyricLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.lyricLabel];
    
    }
    return self;
}


- (void)setAlbumImageName:(NSString *)albumImageName
{
    _albumImageName = albumImageName;
    [self.albumImageView setImage:[UIImage imageNamed:albumImageName]];
    
}

- (void)setSongName:(NSString *)songName
{
    _songName = songName;
    [self.songTitleLabel setText:songName];
}

- (void)setLyric:(NSString *)lyric
{
    _lyric = lyric;
    [self.lyricLabel setText:lyric];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.albumImageView.frame = CGRectMake(10, 0, 44, 44);
    self.albumImageView.centerY = CGRectGetMaxY(self.bounds)/2;
    
//    CGFloat padding = 5;
    CGFloat labelHeight = 15;
    CGFloat beginOrginY = (CGRectGetMaxY(self.bounds)-labelHeight*2)/2;
    
    
    self.songTitleLabel.frame = CGRectMake(CGRectGetMaxX(self.albumImageView.frame), beginOrginY, CGRectGetMaxX(self.bounds), labelHeight);
    
    self.lyricLabel.frame = CGRectMake(CGRectGetMaxX(self.albumImageView.frame), CGRectGetMaxY(self.songTitleLabel.frame), CGRectGetMaxX(self.bounds), labelHeight);
    
}


@end
