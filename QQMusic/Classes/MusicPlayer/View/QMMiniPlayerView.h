//
//  QMMiniPlayerView.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QMMiniPlayerViewDelegate <NSObject>

- (void)miniPlayViewTouchEndAction;

@end

@interface QMMiniPlayerView : UIView

@property (nonatomic, assign) id<QMMiniPlayerViewDelegate> playingDelegate;

- (UIImageView *)playingSongAlbumImageView;


//- (void)startBuffingAnimation;
//
//- (void)stopBuffingAnimation;
//
//- (void)startAlbumRotation;
//
//- (void)startAlbumRotationWithAngle:(CGFloat)angle;
//
//- (void)pauseAlbumRotation;
//
//
//- (void)pauseAlbumRotationWithAngle:(CGFloat)angle;
//
//- (void)albumAnimationResume;
//
//- (void)stopAlbumRotation;
//
//- (void)canExecuteAnimation;
//
//
//
//- (void)applyGradientMaskView:(UIView *)maskView;
//
//
//- (void)onColorChange;
//
//
//- (void)onUserLanguageChanged;
//
//- (void)onUserPerferredFontChange;
//
//- (void)layoutSongInfoView;
//
//- (void)changeSongListIcon:(BOOL)icon;
//
//- (void)infoViewAtIndex:(int)index;
//
//
//- (void)updateImageInInfoView:(UIView *)infoView ForSong:(id)song;
//
//- (void)setCurrentSingerNameIsTips:(id)tips;
//
//- (void)setDisplaySingerName:(NSString *)signerName;
//
//- (void)setDisplaySingerName:(NSString *)signerName forSeconds:(CGFloat)seconds;
//
//- (void)resumeUpdateLyric:(NSString *)lyric;
//
//- (void)setDisplayLyric:(NSString *)lyric;
//
//- (void)setTipsHidden;
//
//- (void)setWhiteColorForTextInProfile;
//
//- (void)autoPlayNextSong:(id)song;
//
//- (void)startScrollViewAnimation:(id)animation;
//
//- (void)playOrPauseButtonPressed:(id)sender;
//
//- (void)playNextSong:(id)song;
//
//- (void)playPreviousSong:(id)song;
//
//- (void)showPlayList:(id)arg1;
//
//- (void)updataProgress:(CGFloat)pregress;

//
//- (void)touchEndAction;
//
//
//- (void)delaySetScrollviewContentSize;

@end
