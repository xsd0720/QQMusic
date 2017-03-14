//
//  BETouchView.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BETouchView : UIView

@property (nonatomic, strong) UIView *leftView;

@property (nonatomic, strong) UIView *centerView;

@property (nonatomic, strong) UIView *rightView;

- (void)preLayoutSubView;

@end
