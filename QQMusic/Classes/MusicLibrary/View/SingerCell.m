//
//  SingerCell.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/20.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "SingerCell.h"

@implementation SingerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(10, 0, 40, 40);
    self.imageView.layer.cornerRadius = 20;
    self.imageView.backgroundColor = [UIColor cyanColor];
    
    self.imageView.centerY = CGRectGetMaxY(self.bounds)/2;
    
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame)+10;
    
}

@end
