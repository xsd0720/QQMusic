//
//  BETouchView.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "BETouchView.h"

@implementation BETouchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MAIN_TONE_COLOR;
    }
    return self;
}

- (void)setLeftView:(UIView *)leftView
{
    _leftView = leftView;
    [self addSubview:_leftView];
    
    [self preLayoutSubView];
}

- (void)setCenterView:(UIView *)centerView
{
    _centerView = centerView;
    [self addSubview:_centerView];
    
    [self preLayoutSubView];
}

- (void)setRightView:(UIView *)rightView
{
    _rightView = rightView;
    [self addSubview:_rightView];
    
    [self preLayoutSubView];
}

- (void)preLayoutSubView
{
    if (_leftView) {
        _leftView.frame = CGRectMake(0, SYS_STATUSBAR_HEIGHT, CGRectGetMaxX(self.leftView.bounds), CGRectGetMaxY(self.leftView.bounds));
    }
    
    if (_rightView) {
        _rightView.frame = CGRectMake(CGRectGetMaxX(self.bounds)-CGRectGetMaxX(self.rightView.bounds), SYS_STATUSBAR_HEIGHT, CGRectGetMaxX(self.rightView.bounds), CGRectGetMaxY(self.rightView.bounds));
    }
    
    if (_centerView) {
        _centerView.frame = CGRectMake(0, SYS_STATUSBAR_HEIGHT, CGRectGetMaxX(self.bounds)-CGRectGetMaxX(self.leftView.bounds)-CGRectGetMaxX(self.rightView.bounds), CGRectGetMaxY(self.centerView.bounds));
        _centerView.centerX = self.bounds.size.width/2;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
  
}

@end
