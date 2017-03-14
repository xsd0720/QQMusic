//
//  QMMiniPlayerScrollItem.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/13.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AutoScrollLabel.h"
@interface QMMiniPlayerScrollItem : UIView

@property (nonatomic, strong) UIImageView *albumImageView;

@property (nonatomic, strong) UITextView *songTitleLabel;

@property (nonatomic, strong) UILabel *lyricLabel;

@property (nonatomic) NSString *albumImageName;

@property (nonatomic) NSString *songName;

@property (nonatomic) NSString *lyric;

@end
