//
//  QMHttpTool.m
//  QQMusic
//
//  Created by xwmedia01 on 17/3/2.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMHttpTool.h"
#import "AFNetworking.h"
@implementation QMHttpTool

/**
 *  单例
 *
 *  @return 单例对象
 */
+ (QMHttpTool *)sharedInstance
{
    static QMHttpTool *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


/**
 *  GET 请求
 *
 *  @param URLString  请求地址URL
 *  @param parameters 附带参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(QMHttpToolSuccessBlock)success
    failure:(QMHttpToolFailBlock)failure
{
    //发起请求
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain", nil];
    
    [manager.requestSerializer setValue:@"http://music.163.com/search/" forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:@"music.163.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36" forHTTPHeaderField:@"User-Agent"];
    
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
             success(responseObject);
        }
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];
    
}


/**
 *  POST 请求
 *
 *  @param URLString  请求地址URL
 *  @param parameters 附带参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(QMHttpToolSuccessBlock)success
     failure:(QMHttpToolFailBlock)failure
{
    //发起请求
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"http://music.163.com/search/" forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:@"music.163.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36" forHTTPHeaderField:@"User-Agent"];
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];



}

@end
