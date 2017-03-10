//
//  QMRootTopBarViewController.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/10.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMNavigationController.h"

@protocol QMRootTopBarViewControllerDelegate <NSObject>

- (void)showSliderMenuAction;

- (void)containersNavRightButtonAction;

@end

@interface QMRootTopBarViewController : QMNavigationController

@property (nonatomic, assign) id<QMRootTopBarViewControllerDelegate> rootTopBarDelegate;

- (BOOL)scrollOffsetXIsZero;

@end
