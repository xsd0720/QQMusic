//
//  BENoTouchView.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/14.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PlayMode) {
    PlayModeRandom = 0,
    PlayModeRepeat = 1,
    PlayModeRepeatOne = 2,
    
    
};


@protocol BENoTouchViewDelegate <NSObject>

- (void)BENoTouchViewShouldPlay;

- (void)BENoTouchViewShouldPause;

@end

@interface BENoTouchView : UIView

@property (nonatomic, strong) id<BENoTouchViewDelegate> delegate;

@property (nonatomic) PlayMode playMode;

- (void)updateCurrentTimeLabel:(NSString *)text;

- (void)updateDurationTimeLabel:(NSString *)text;

- (void)updateSliderValue:(CGFloat)value;

@end
