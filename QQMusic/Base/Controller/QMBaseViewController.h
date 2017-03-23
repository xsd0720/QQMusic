//
//  QMBaseViewController.h
//  QQMusic
//
//  Created by xwmedia01 on 17/3/2.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BETouchView.h"

#define HASNAV_RECT     CGRectMake(0, STATUS_AND_NAV_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_AND_NAV_BAR_HEIGHT-55)

@interface QMBaseViewController : UIViewController

@property (nonatomic, strong) BETouchView *navView;

@property (nonatomic) BOOL showNav;

@end
