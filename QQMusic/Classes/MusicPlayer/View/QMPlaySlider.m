//
//  QMPlaySlider.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/23.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMPlaySlider.h"

#define SPEED_SECONDS    20       //5pt /s
@interface QMPlaySlider()

@property (nonatomic, strong) UIView *trackView;

@property (nonatomic, strong) UIView *minimumView;

@property (nonatomic, strong) UIView *cacheValueView;

@property (nonatomic, strong) UIView *maximumView;

@property (nonatomic, strong) UIButton *thumb;

@end

@implementation QMPlaySlider

- (instancetype)initWithFrame:(CGRect)frame supportCache:(BOOL)supprotCache
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.trackView = [[UIView alloc] initWithFrame:CGRectMake(TRACK_MARGIN, 0, frame.size.width-2*TRACK_MARGIN, frame.size.height)];
        [self addSubview:self.trackView];
        
        CGFloat orginY = (frame.size.height-TRACK_HEIGHT)/2;
        
        self.maximumView = [[UIView alloc] initWithFrame:CGRectMake(0, orginY, CGRectGetMaxX(self.trackView.bounds), TRACK_HEIGHT)];
        [self.trackView addSubview:self.maximumView];
        
        if (supprotCache) {
            self.cacheValueView = [[UIView alloc] initWithFrame:CGRectMake(0, orginY, 0, TRACK_HEIGHT)];
            [self.trackView addSubview:self.cacheValueView];
        }
        
        self.minimumView = [[UIView alloc] initWithFrame:CGRectMake(0, orginY, 0, TRACK_HEIGHT)];
        [self.trackView addSubview:self.minimumView];

        self.thumb = [UIButton buttonWithType:UIButtonTypeCustom];
        self.thumb.frame = CGRectMake(0, 20, 30, 30);
        [self.thumb addTarget:self action:@selector(thumbTouchesBegan:withEvent:)forControlEvents: UIControlEventTouchDown];
        [self.thumb addTarget:self action:@selector(thumbTouchesMoved:withEvent:)forControlEvents: UIControlEventTouchDragInside];
        [self.thumb addTarget:self action:@selector(thumbTouchesEnded:withEvent:)forControlEvents: UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
        [self.trackView addSubview:self.thumb];
        
        [self configDefault];
    }
    return self;
}

- (void)configDefault
{
    
    _minimumValue = 0;
    _maximumValue = 1;
    
    //define to zero
    self.value = 0;
}

- (void)setValue:(float)value
{
    CGFloat maximum = self.maximumValue-self.minimumValue;
    if (maximum < 0) {
        maximum = 0;
    }
    
    if (value > self.maximumValue) {
        value = self.maximumValue;
    }
    
    if (value < 0) {
        value = 0;
    }
    
    _value = value;
    
    
    CGFloat minimum = value-self.minimumValue;
    if (minimum < 0) {
        minimum = 0;
    }
    
    CGFloat prop = minimum/maximum;
    if (isfinite(prop)) {
        if (!isnan(prop)) {
            if (prop > 1) {
                prop = 1;
            }

            self.minimumView.width = CGRectGetMaxX(self.trackView.bounds)*prop;
            self.maximumView.x = CGRectGetMaxX(self.minimumView.frame);
            self.maximumView.width = CGRectGetMaxX(self.trackView.bounds)-CGRectGetMaxX(self.minimumView.frame);
            self.thumb.centerX = CGRectGetMaxX(self.minimumView.frame);

        }
    }

    
}


- (void)setCacheValue:(float)cacheValue
{
    CGFloat maximum = self.maximumValue-self.minimumValue;
    if (maximum < 0) {
        maximum = 0;
    }
    
    if (cacheValue > self.maximumValue) {
        cacheValue = self.maximumValue;
    }
    if (cacheValue < 0) {
        cacheValue = 0;
    }
    _cacheValue = cacheValue;
    
    CGFloat minimum = cacheValue-self.minimumValue;
    if (minimum < 0) {
        minimum = 0;
    }
    
    CGFloat prop = minimum/maximum;
    if (isfinite(prop)) {
        if (!isnan(prop)) {
            if (prop > 1) {
                prop = 1;
            }
            self.cacheValueView.width = CGRectGetMaxX(self.trackView.bounds)*prop;
        }
    }
}


- (void)setMinimumTrackTintColor:(UIColor *)minimumTrackTintColor
{
    _minimumTrackTintColor = minimumTrackTintColor;
    self.minimumView.backgroundColor = minimumTrackTintColor;
}
- (void)setMaximumTrackTintColor:(UIColor *)maximumTrackTintColor
{
    _maximumTrackTintColor = maximumTrackTintColor;
    self.maximumView.backgroundColor = maximumTrackTintColor;
}

- (void)setCacheimumTrackTintColor:(UIColor *)cacheimumTrackTintColor
{
    _cacheimumTrackTintColor = cacheimumTrackTintColor;
    self.cacheValueView.backgroundColor = cacheimumTrackTintColor;
}

- (void)setMinimumValue:(float)minimumValue
{
    _minimumValue = minimumValue;
    
    self.value = _value;
}

- (void)setMaximumValue:(float)maximumValue
{
    _maximumValue = maximumValue;
    
    self.value = _value;
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor
{
    _thumbTintColor = thumbTintColor;
}

- (void)setValue:(float)value animated:(BOOL)animated
{
    if (animated) {
        CGFloat duration = fabs(value-self.value)/SPEED_SECONDS;
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.value = value;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)setCacheValue:(float)value animated:(BOOL)animated
{
    if (animated) {
        CGFloat duration = fabs(value-self.value)/SPEED_SECONDS;
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.cacheValue = value;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state
{
    [self.thumb setImage:image forState:state];
    self.thumb.width = image.size.width;
    self.thumb.height = image.size.height;
    
    self.thumb.centerY = CGRectGetMaxY(self.bounds)/2;
    self.value = _value;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(self.trackView.frame, [[touches anyObject] locationInView:self])) {
        [self thumbTouchesMoved:touches withEvent:event];
    }
}

- (void)thumbTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(thumbTouchesBegan)]) {
        [self.delegate thumbTouchesBegan];
    }
}

- (void)thumbTouchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat centerX = [[[event allTouches] anyObject] locationInView:self.trackView].x;
    [self touchMoveValue:centerX];
  
}

- (void)thumbTouchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat centerX = [[[event allTouches] anyObject] locationInView:self.trackView].x;
    [self touchMoveValue:centerX];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(thumbTouchesBegan)]) {
        [self.delegate thumbTouchesEnded];
    }
    
}


- (void)touchMoveValue:(CGFloat)centerX
{
    if (centerX < 0) {
        centerX = 0;
    }
    if (centerX > CGRectGetMaxX(self.trackView.bounds)) {
        centerX = CGRectGetMaxX(self.trackView.bounds);
    }
    CGFloat maximum = self.maximumValue-self.minimumValue;
    if (maximum < 0) {
        maximum = 0;
    }
    
    CGFloat p = centerX/CGRectGetMaxX(self.trackView.bounds);
    self.value = maximum*p+self.minimumValue;
}

@end
