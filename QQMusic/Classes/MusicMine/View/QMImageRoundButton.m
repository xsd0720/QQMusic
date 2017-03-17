//
//  QMImageRoundButton.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMImageRoundButton.h"

@interface QMImageRoundButton()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation QMImageRoundButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, frame.size.height)];
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.iconImageView];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, frame.size.height)];
        self.textLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.textLabel];
        
        
        
    }
    return self;
}


- (void)setTitle:(NSString *)title imageName:(NSString *)imageName
{
    self.textLabel.text = title;
    CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(MAXFLOAT, CGRectGetMaxY(self.textLabel.bounds))];
    self.textLabel.width = textLabelSize.width;
    
    self.iconImageView.image = [UIImage imageNamed:imageName];
    
    CGFloat padding = 10;
    
    self.iconImageView.x = 10;
    self.iconImageView.centerY = CGRectGetMaxY(self.bounds)/2;
    
    self.textLabel.x = CGRectGetMaxX(self.iconImageView.frame) + 5;
    
    self.width = CGRectGetMaxX(self.textLabel.frame)+padding;
    
    self.layer.cornerRadius = CGRectGetMaxY(self.bounds)/2;
    self.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.5] CGColor];
    self.layer.borderWidth = 1;
    
}



@end
