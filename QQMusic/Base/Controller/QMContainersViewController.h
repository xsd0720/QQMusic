//
//  QMContainersViewController.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMBaseViewController.h"

@protocol QMContainersViewControllerDelegate <NSObject>

- (void)showSliderMenuAction;

- (void)containersNavRightButtonAction;

@end

@interface QMContainersViewController : QMBaseViewController

@property (nonatomic, assign) id<QMContainersViewControllerDelegate> containersDelegate;

- (BOOL)scrollOffsetXIsZero;

@end
