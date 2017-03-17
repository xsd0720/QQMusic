//
//  MyMusicGridNumCell.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "MyMusicGridNumCell.h"

@interface MyMusicGridNumCell()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation MyMusicGridNumCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.iconImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        
        self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 15)];
        self.numberLabel.font = [UIFont systemFontOfSize:11];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.numberLabel];
        
    }
    return self;
}

- (void)setDatasource:(NSDictionary *)datasource
{
    _datasource = datasource;
    
    NSString *imageName = datasource[@"imageName"];
    NSString *title = datasource[@"title"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    self.iconImageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.iconImageView.image = image;
    
    self.titleLabel.text = title;
    self.numberLabel.text = @"123";
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat totalHeight = CGRectGetMaxY(self.iconImageView.bounds)+CGRectGetMaxY(self.titleLabel.bounds)+CGRectGetMaxY(self.numberLabel.bounds);
    
    self.iconImageView.centerX = CGRectGetMaxX(self.bounds)/2;
    self.iconImageView.y = CGRectGetMaxY(self.bounds)-totalHeight-20;
    self.titleLabel.y = CGRectGetMaxY(self.iconImageView.frame);
    self.numberLabel.y = CGRectGetMaxY(self.titleLabel.frame);

    
}

@end
