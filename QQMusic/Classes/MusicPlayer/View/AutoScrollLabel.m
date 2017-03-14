//
//  AutoScrollLabel.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/13.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "AutoScrollLabel.h"

#define SPEED  20
#define DELAYTIME   2

@interface AutoScrollLabel()

@property (nonatomic, strong) UILabel *defineLabel;

@property (nonatomic, strong) UILabel *cycleLabelOne;

@property (nonatomic, strong) UILabel *cycleLabelTwo;

@property (nonatomic, assign) CGFloat textWidth;

@property (nonatomic) CADisplayLink *displayLink;

@property (nonatomic) NSTimer *timer;


@end

@implementation AutoScrollLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        self.defineLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.defineLabel.textAlignment = NSTextAlignmentCenter;
        
        self.cycleLabelOne = [[UILabel alloc] initWithFrame:CGRectZero];
        self.cycleLabelOne.textAlignment = NSTextAlignmentCenter;
        self.cycleLabelTwo = [[UILabel alloc] initWithFrame:CGRectZero];
        self.cycleLabelTwo.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}


- (void)setUpDefineLabel
{
//    [self.subviews performSelector:@selector(removeFromSuperview)];
    
    self.defineLabel.frame = self.bounds;
    [self addSubview:self.defineLabel];
}

- (void)setUpCycleLabel
{
   
    
//    [self.subviews performSelector:@selector(removeFromSuperview)];
    [self addSubview:self.cycleLabelOne];
    [self addSubview:self.cycleLabelTwo];
    
    self.cycleLabelOne.frame = CGRectMake(0, 0, self.textWidth, self.bounds.size.height);
    self.cycleLabelTwo.frame = CGRectMake( self.textWidth+10, 0, self.textWidth, self.bounds.size.height);
    
    self.cycleLabelOne.centerY = self.cycleLabelTwo.centerY = CGRectGetMaxY(self.bounds)/2;
    
    [self performSelector:@selector(startCycleAnimation) withObject:nil afterDelay:DELAYTIME];
}

- (void)startCycleAnimation
{
    CGFloat moveDistance = (self.textWidth+10);
    
    [UIView animateWithDuration:moveDistance/SPEED delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.cycleLabelOne.x -= moveDistance;
        self.cycleLabelTwo.x -= moveDistance;
    } completion:^(BOOL finished) {
        
        if (self.cycleLabelOne.x == -moveDistance) {
            self.cycleLabelOne.x = moveDistance;
        }
        if (self.cycleLabelTwo.x == -moveDistance) {
            self.cycleLabelTwo.x = moveDistance;
        }
        [self performSelector:@selector(startCycleAnimation) withObject:nil afterDelay:DELAYTIME];
        
    }];

}


- (void)stopCycleAnimation
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self.cycleLabelOne.layer removeAllAnimations];
    [self.cycleLabelTwo.layer removeAllAnimations];
}

- (void)setFont:(UIFont *)font
{
    self.defineLabel.font = font;
    self.cycleLabelTwo.font = font;
    self.cycleLabelOne.font = font;
}

- (void)setTextColor:(UIColor *)textColor
{
    self.defineLabel.textColor = textColor;
    self.cycleLabelTwo.textColor = textColor;
    self.cycleLabelOne.textColor = textColor;
}


- (void)setText:(NSString *)text
{
    _text = text;
    
    self.defineLabel.text = text;
    self.cycleLabelOne.text = text;
    self.cycleLabelTwo.text  =text;
    

    [self.defineLabel setText:text];
    CGFloat textWidth = [self.defineLabel sizeThatFits:CGSizeMake(MAXFLOAT, 30)].width;
    self.textWidth = ceil(textWidth);

    
    if (textWidth <= CGRectGetMaxX(self.bounds)) {
        [self setUpDefineLabel];
    }else
    {
        [self setUpCycleLabel];
    }
    
}

- (void)dismiss
{
    [self stopCycleAnimation];
}


@end
