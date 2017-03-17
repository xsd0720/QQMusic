//
//  MyMusicUserInfoCollectionCell.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "MyMusicUserInfoCollectionCell.h"
#import "QMImageRoundButton.h"
@interface MyMusicUserInfoCollectionCell()

@property (nonatomic, strong) QMImageRoundButton *listenDurationButton;

@property (nonatomic, strong) UIButton *userHeadButton;

@property (nonatomic, strong) QMImageRoundButton *openVIPButton;

@property (nonatomic, strong) UILabel *usernameLabel;

@end


@implementation MyMusicUserInfoCollectionCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.listenDurationButton = [[QMImageRoundButton alloc] initWithFrame:CGRectMake(0, 0, 65, 30)];
        [self.listenDurationButton setTitle:@"4分钟" imageName:@"listenlevel"];
        [self addSubview:self.listenDurationButton];
        
        self.userHeadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.userHeadButton setFrame:CGRectMake(0, 0, 55, 55)];
        [self.userHeadButton setImage:[UIImage imageNamed:@"profile_default_user"] forState:UIControlStateNormal];
        [self addSubview:self.userHeadButton];
        
        
        self.openVIPButton =  [[QMImageRoundButton alloc] initWithFrame:CGRectMake(0, 0, 65, 30)];
        [self.openVIPButton setTitle:@"开通" imageName:@"more_icon_vip_normal"];
        [self addSubview:self.openVIPButton];
        
        self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 20)];
        self.usernameLabel.text = @"—   小白菜   —";
        self.usernameLabel.font = [UIFont systemFontOfSize:15];
        self.usernameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.usernameLabel];
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 20;
  
    
    self.listenDurationButton.x = CGRectGetMaxX(self.bounds)/2-margin-CGRectGetMaxX(self.userHeadButton.bounds)/2-CGRectGetMaxX(self.listenDurationButton.bounds);
    self.userHeadButton.centerX = CGRectGetMaxX(self.bounds)/2;
    self.openVIPButton.x = CGRectGetMaxX(self.userHeadButton.frame)+margin;
    
    self.listenDurationButton.centerY = self.openVIPButton.centerY = CGRectGetMaxY(self.bounds)/2-20;
    self.userHeadButton.centerY = self.listenDurationButton.centerY;
    
    self.usernameLabel.y = CGRectGetMaxY(self.userHeadButton.frame)+10;
    self.usernameLabel.width = CGRectGetMaxX(self.bounds);
    
    
}


@end
