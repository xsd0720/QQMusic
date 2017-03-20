//
//  LocalDataSource.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "LocalDataSource.h"

@implementation LocalDataSource

+ (LocalDataSource *)shareDataSource
{
    static LocalDataSource *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSDictionary *)myMusicGridResponse
{
    return @{
             @"items":@[
                 
                     @{
                         @"imageName" : @"mymusic_icon_allsongs_normal",
                         @"imageName_HL" : @"mymusic_icon_allsongs_highlight",
                         @"title" : @"全部歌曲",
                         
                         },
                     @{
                         @"imageName" : @"mymusic_icon_download_normal",
                         @"imageName_HL" : @"mymusic_icon_download_highlight",
                         @"title" : @"下载歌曲",
                         
                         },
                     @{
                         @"imageName" : @"mymusic_icon_history_normal",
                         @"imageName_HL" : @"mymusic_icon_history_highlight",
                         @"title" : @"最近播放",
                         
                         },
                     @{
                         @"imageName" : @"mymusic_icon_favorite_normal",
                         @"imageName_HL" : @"mymusic_icon_favorite_highlight",
                         @"title" : @"我喜欢",
                         
                         },
                     @{
                         @"imageName" : @"mymusic_icon_mv_normal",
                         @"imageName_HL" : @"mymusic_icon_mv_highlight",
                         @"title" : @"下载MV",
                         
                         },
                     @{
                         @"imageName" : @"mymusic_icon_paidmusic_normal",
                         @"imageName_HL" : @"mymusic_icon_paidmusic_highlight",
                         @"title" : @"已购音乐",
                         
                         },
                     
                     
                 ]
             };
}

- (NSDictionary *)libraryMusicGridResponse
{
    return @{
             @"items" : @[
                     @{
                         @"imageName" : @"",
                         @"imageName_HL" : @"",
                         @"title" : @"歌手",
                         },
                     @{
                         @"imageName" : @"",
                         @"imageName_HL" : @"",
                         @"title" : @"排行",
                         },
                     @{
                         @"imageName" : @"",
                         @"imageName_HL" : @"",
                         @"title" : @"电台",
                         },
                     @{
                         @"imageName" : @"",
                         @"imageName_HL" : @"",
                         @"title" : @"分类歌单",
                         },
                     @{
                         @"imageName" : @"",
                         @"imageName_HL" : @"",
                         @"title" : @"视频MV",
                         },
                     @{
                         @"imageName" : @"",
                         @"imageName_HL" : @"",
                         @"title" : @"数字专辑",
                         },
                     
                     ]
             
             };
}


@end
