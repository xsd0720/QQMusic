//
//  LibMusicGridNumCell.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/20.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "LibMusicGridNumCell.h"

@interface LibMusicGridNumCell()

@property (nonatomic, strong) UIButton *iconButton;


@end

@implementation LibMusicGridNumCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.iconButton setTitleColor:RGB(10, 10, 10) forState:UIControlStateNormal];
        self.iconButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.iconButton.userInteractionEnabled = NO;
        [self addSubview:self.iconButton];
        
    }
    return self;
}

- (void)setDatasource:(NSDictionary *)datasource
{
    _datasource = datasource;
    NSString *title = datasource[@"title"];
    NSString *imageName = datasource[@"imageName"];
//    [self.iconButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.iconButton setTitle:title forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconButton.frame = self.bounds;
    
}

@end
