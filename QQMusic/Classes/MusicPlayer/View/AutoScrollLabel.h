//
//  AutoScrollLabel.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/13.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollLabel : UIView

@property (nonatomic) NSString *text;

@property (nonatomic) UIFont *font;

@property (nonatomic) UIColor *textColor;

- (void)dismiss;

@end
