//
//  LocalDataSource.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LDS   [LocalDataSource shareDataSource]

@interface LocalDataSource : NSObject

+ (instancetype)shareDataSource;

@property (nonatomic, strong) NSDictionary *myMusicGridResponse;

@end
