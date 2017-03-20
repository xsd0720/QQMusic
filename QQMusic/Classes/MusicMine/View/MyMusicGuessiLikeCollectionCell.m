//
//  MyMusicGuessiLikeCollectionCell.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "MyMusicGuessiLikeCollectionCell.h"

@interface MyMusicGuessiLikeCollectionCell()

@property (nonatomic, strong) UIButton *playPauseButton;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation MyMusicGuessiLikeCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.iconImageView];
        
        self.playPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.iconImageView addSubview:self.playPauseButton];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = RGB(10, 10, 10);
        self.titleLabel.text = @"test";
        [self addSubview:self.titleLabel];
        
        self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.subTitleLabel.font = [UIFont systemFontOfSize:11];
        self.subTitleLabel.textColor = [UIColor lightGrayColor];
        self.subTitleLabel.text = @"subtest";
        [self addSubview:self.subTitleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImageView.frame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
    self.playPauseButton.frame = self.iconImageView.bounds;
    
    CGFloat labelHeight = 20;
    CGFloat labelWidth = CGRectGetMaxX(self.bounds)-CGRectGetMaxX(self.iconImageView.frame);
    CGFloat beginOrginY = (CGRectGetMaxY(self.bounds)-labelHeight*2)/2;
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+10, beginOrginY, labelWidth, labelHeight);
    self.subTitleLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+10, CGRectGetMaxY(self.titleLabel.frame), labelWidth, labelHeight);
}

@end
