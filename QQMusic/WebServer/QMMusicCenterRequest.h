//
//  QMMusicCenterRequest.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/16.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMHttpTool.h"
@interface QMMusicCenterRequest : NSObject


+ (QMMusicCenterRequest *)sharedRequest;

+ (void)loginWithUserName:(NSString *)userName
                 password:(NSString *)password
                  success:(QMHttpToolSuccessBlock)success
                  failure:(QMHttpToolFailBlock)failure;

//'/song\?id=(\d+)'
+ (void)getArtistListWithoffset:(int)offset total:(BOOL)total limit:(int)limit
                        success:(QMHttpToolSuccessBlock)success
                        failure:(QMHttpToolFailBlock)failure;

+ (void)getTopSongListWithURL:(NSString *)url
                      success:(QMHttpToolSuccessBlock)success
                      failure:(QMHttpToolFailBlock)failure;

+ (void)getSongDetailWithIds:(NSArray *)songids
                     success:(QMHttpToolSuccessBlock)success
                     failure:(QMHttpToolFailBlock)failure;

+ (void)songs_detail_new_api:(NSArray *)music_id
                     success:(QMHttpToolSuccessBlock)success
                     failure:(QMHttpToolFailBlock)failure;

+ (void)getSongDetail:(NSArray *)music_ids
              success:(QMHttpToolSuccessBlock)success
              failure:(QMHttpToolFailBlock)failure;


+ (void)getSongLyric:(NSString *)musicId
             success:(QMHttpToolSuccessBlock)success
             failure:(QMHttpToolFailBlock)failure;


- (void)decryed;
@end
