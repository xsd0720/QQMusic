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


- (NSDictionary *)rankesResponse
{
    return @{
             @"items":@[
                     @{
                         @"name" : @"云音乐新歌榜",
                         @"url"  : @"/discover/toplist?id=3779629"
                         },
                     @{
                         @"name" : @"云音乐热歌榜",
                         @"url"  : @"/discover/toplist?id=3778678"
                         },
                     @{
                         @"name" : @"云音乐飙升榜",
                         @"url"  : @"/discover/toplist?id=19723756"
                         },
                     @{
                         @"name" : @"云音乐电音榜",
                         @"url"  : @"/discover/toplist?id=10520166"
                         },
                     @{
                         @"name" : @"UK排行榜周榜",
                         @"url"  : @"/discover/toplist?id=180106"
                         },
                     @{
                         @"name" : @"美国Billboard周榜",
                         @"url"  : @"/discover/toplist?id=60198"
                         },
                     @{
                         @"name" : @"KTV嗨榜",
                         @"url"  : @"/discover/toplist?id=21845217"
                         },
                     @{
                         @"name" : @"iTunes榜",
                         @"url"  : @"/discover/toplist?id=11641012"
                         },
                     @{
                         @"name" : @"Hit FM Top榜",
                         @"url"  : @"/discover/toplist?id=120001"
                         },
                     @{
                         @"name" : @"日本Oricon周榜",
                         @"url"  : @"/discover/toplist?id=60131"
                         },
                     @{
                         @"name" : @"韩国Melon排行榜周榜",
                         @"url"  : @"/discover/toplist?id=3733003"
                         },
                     @{
                         @"name" : @"韩国Mnet排行榜周榜",
                         @"url"  : @"/discover/toplist?id=60255"
                         },
                     
                     
                     ]
             };
}

@end
