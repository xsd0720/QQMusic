//
//  QMMiniPlayerView.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMiniPlayerView.h"



@interface QMMiniPlayerView()<UIScrollViewDelegate>

@property (nonatomic) NSMutableArray *songInfoViewArray;

@property (nonatomic) BOOL shouldUpdateLyric;
@property (nonatomic) BOOL firstInfoViewStartX;
@property (nonatomic) BOOL secondInfoViewStartX;
@property (nonatomic) BOOL thirdInfoViewStartX;

@property (nonatomic) BOOL startPoint;
@property (nonatomic) BOOL isBlackModel;
@property (nonatomic) BOOL isNotFirstStartAnimation;

@property (nonatomic) CGFloat angle;
@property (nonatomic) CGFloat infoViewWidth;

@property (nonatomic, strong) UIToolbar *bgToolBar;
@property (nonatomic, strong) UIScrollView *songBaseScrollView;
@property (nonatomic, strong) UIButton *playSongButton;
@property (nonatomic, strong) UIButton *songListButton;

@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIView *emptyBaseView;
@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) UILabel *emptyTextLabel;
@property (nonatomic, strong) UIButton *emptyPlayButton;
@property (nonatomic, strong) UIButton *emptyListButton;

@property (nonatomic) CALayer *gradientLayer;

@end

@implementation QMMiniPlayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpSubview];
    }
    return self;
}

- (void)setUpSubview
{
    
    self.bgToolBar = [[UIToolbar alloc] initWithFrame:self.bounds];
    [self addSubview:self.bgToolBar];
    
    self.baseView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:self.baseView];

    self.playSongButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playSongButton.frame = CGRectMake(0, 0, 55, 55);
    [self.playSongButton setImage:[UIImage imageNamed:@"more_icon_about"] forState:UIControlStateNormal];

    [self.baseView addSubview:self.playSongButton];
    
    //
//    self.emptyBaseView = [[UIView alloc] initWithFrame:self.bounds];
//    [self addSubview:self.emptyBaseView];
    
    
//    self.songBaseScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
//    self.songBaseScrollView.width = SCREEN_HEIGHT-100;
//    [self.songBaseScrollView setScrollsToTop:NO];
//    [self.songBaseScrollView setScrollEnabled:YES];
//    [self.songBaseScrollView setShowsVerticalScrollIndicator:NO];
//    [self.songBaseScrollView setShowsHorizontalScrollIndicator:NO];
//    self.songBaseScrollView.pagingEnabled = YES;
//    [self.songBaseScrollView setDirectionalLockEnabled:YES];
//    [self.songBaseScrollView setContentSize:self.songBaseScrollView.bounds.size];
//    self.songBaseScrollView.delegate = self;
//    [self addSubview:self.songBaseScrollView];
    
//    
//    r4 = [[r10 createCustomButtonByImageName:@"miniplayer_btn_play_normal.png" hilightedImageName:@"miniplayer_btn_play_highlight.png" selectedImageName:@"miniplayer_btn_pause_normal.png" hilightedSelectedImageName:@"miniplayer_btn_pause_highlight.png" disabledImageName:0x0 frame:s0] retain];
//    [r10 setPlaySongButton:r4];
//    

}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.playingDelegate && [self.playingDelegate respondsToSelector:@selector(miniPlayViewTouchEndAction)]) {
        [self.playingDelegate miniPlayViewTouchEndAction];
    }
}

- (void)createCustomButtonByImageName:(NSString *)imageName hilightedImageName:(NSString *)hilightedImageName selectedImageName:(NSString *)selectedImageName hilightedSelectedImageName:(NSString *)hilightedSelectedImageName disabledImageName:(NSString *)disabledImageName frame:(CGRect *)frame
{
    
}

- (void)startBuffingAnimation
{
    
}

- (void)stopBuffingAnimation
{
    
}

- (void)startAlbumRotation
{
    
}

- (void)startAlbumRotationWithAngle:(CGFloat)angle
{
    
}

- (void)pauseAlbumRotation
{
    
}


- (void)pauseAlbumRotationWithAngle:(CGFloat)angle
{
    
}

- (void)albumAnimationResume
{
    
}

- (void)stopAlbumRotation
{
    
}

- (void)canExecuteAnimation
{
    
}



- (void)applyGradientMaskView:(UIView *)maskView
{
    
}


- (void)onColorChange
{
    
}


- (void)onUserLanguageChanged
{
    
}

- (void)onUserPerferredFontChange
{
    
}

- (void)layoutSongInfoView
{
    
}

- (void)changeSongListIcon:(BOOL)icon
{
    
}

- (void)infoViewAtIndex:(int)index
{
    
}


- (void)updateImageInInfoView:(UIView *)infoView ForSong:(id)song
{
    
}

- (void)setCurrentSingerNameIsTips:(id)tips
{
    
}

- (void)setDisplaySingerName:(NSString *)signerName
{
    
}

- (void)setDisplaySingerName:(NSString *)signerName forSeconds:(CGFloat)seconds
{
    
}

- (void)resumeUpdateLyric:(NSString *)lyric
{
    
}

- (void)setDisplayLyric:(NSString *)lyric
{
    
}

- (void)setTipsHidden
{
    
}

- (void)setWhiteColorForTextInProfile
{
    
}

- (void)autoPlayNextSong:(id)song
{
    
}

- (void)startScrollViewAnimation:(id)animation
{
    
}

- (void)playOrPauseButtonPressed:(id)sender
{
    
}

- (void)playNextSong:(id)song
{
    
}

- (void)playPreviousSong:(id)song
{
    
}

- (void)showPlayList:(id)arg1
{
    
}

- (void)updataProgress:(CGFloat)pregress
{
    
}

- (UIButton *)playingSongAlbumImageView
{
    return self.playSongButton;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        [self scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

- (void)delaySetScrollviewContentSize
{
    
}



//- (void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    
//    UIColor *color = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//    [color set];
//    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:rect];
//    [bezierPath stroke];
//}

@end
