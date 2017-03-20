//
//  QMRootTopBarViewController.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMBaseViewController.h"

@protocol QMRootTopBarViewControllerDelegate <NSObject>

- (void)showSliderMenuAction;

- (void)musichallAction;

@end

@interface QMRootTopBarViewController : QMBaseViewController

@property (nonatomic, assign) id<QMRootTopBarViewControllerDelegate> rootTopBarDelegate;

- (BOOL)scrollOffsetXIsZero;

@end
