//
//  QMPlaySlider.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/23.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TRACK_HEIGHT    2
#define TRACK_MARGIN    5

@protocol QMPlaySliderDelegate <NSObject>

- (void)thumbTouchesBegan;

- (void)thumbTouchesEnded;

@end

@interface QMPlaySlider : UIControl

@property (nonatomic, weak, nullable) id<QMPlaySliderDelegate> delegate;

@property(nonatomic) float value;                                 // default 0.0. this value will be pinned to min/max
@property(nonatomic) float cacheValue;                            // default 0.0. this value will be pinned to min/max
@property(nonatomic) float minimumValue;                          // default 0.0. the current value may change if outside new min value
@property(nonatomic) float maximumValue;                          // default 1.0. the current value may change if outside new max value

@property(nullable, nonatomic,strong) UIImage *minimumValueImage;          // default is nil. image that appears to left of control (e.g. speaker off)
@property(nullable, nonatomic,strong) UIImage *maximumValueImage;          // default is nil. image that appears to right of control (e.g. speaker max)

@property(nonatomic,getter=isContinuous) BOOL continuous;        // if set, value change events are generated any time the value changes due to dragging. default = YES

@property(nullable, nonatomic,strong) UIColor *minimumTrackTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
@property(nullable, nonatomic,strong) UIColor *maximumTrackTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
@property(nullable, nonatomic,strong) UIColor *cacheimumTrackTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
@property(nullable, nonatomic,strong) UIColor *thumbTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

- (nullable instancetype)initWithFrame:(CGRect)frame supportCache:(BOOL)supprotCache;

- (void)setValue:(float)value animated:(BOOL)animated; // move slider at fixed velocity (i.e. duration depends on distance). does not send action

- (void)setCacheValue:(float)value animated:(BOOL)animated; // move slider at fixed velocity (i.e. duration depends on distance). does not send action

// set the images for the slider. there are 3, the thumb which is centered by default and the track. You can specify different left and right track
// e.g blue on the left as you increase and white to the right of the thumb. The track images should be 3 part resizable (via UIImage's resizableImage methods) along the direction that is longer

- (void)setThumbImage:(nullable UIImage *)image forState:(UIControlState)state;
//- (void)setMinimumTrackImage:(nullable UIImage *)image forState:(UIControlState)state;
//- (void)setMaximumTrackImage:(nullable UIImage *)image forState:(UIControlState)state;

//- (nullable UIImage *)thumbImageForState:(UIControlState)state;
//- (nullable UIImage *)minimumTrackImageForState:(UIControlState)state;
//- (nullable UIImage *)maximumTrackImageForState:(UIControlState)state;
//
//@property(nullable,nonatomic,readonly) UIImage *currentThumbImage;
//@property(nullable,nonatomic,readonly) UIImage *currentMinimumTrackImage;
//@property(nullable,nonatomic,readonly) UIImage *currentMaximumTrackImage;
//
//// lets a subclass lay out the track and thumb as needed
//- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds;
//- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds;
//- (CGRect)trackRectForBounds:(CGRect)bounds;
//- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value;

@end
