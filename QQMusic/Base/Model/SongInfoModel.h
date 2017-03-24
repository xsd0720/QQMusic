//
//  SongInfoModel.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/24.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface SongInfoModel : JSONModel

@property (nonatomic, strong) NSString *songName;

@property (nonatomic, strong) NSString *songPicUrl;

@property (nonatomic, strong) NSString *songUrl;

@end
