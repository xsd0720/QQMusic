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
    //申明请求的数据是json类型
    //    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
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
    //申明请求的数据是json类型
//        manager.requestSerializer=[AFJSONRequestSerializer serializer];
//    manager.requestSerializer.accep
//    
//    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"application/octet-stream", @"text/plain",nil];

    NSMutableDictionary *d = [NSMutableDictionary dictionary];

    
    [d setValue:@"14059C3D36C7DE64D6C54E46746C8A4D1087F6EA7C6FF8DFB69CF3677E361EC2B8071EF30A88479EC9B3640644E9852179C07C5618C09307152C89242F33156772BF1E99F4D3750CC74B6F6F40A518B49621D4F3BA00883FD86A7069E92E869FB05C72D5F14A980CC8E8D5A424CFDC82889F71F1C08E8C756EAAB6E815A8E5F2F1809AEE16D6B2DDD7F376729F28D1E1E51849DCBB36CCF5F45C077765E205D4832075FA7014C7948395A270E7F41134A4AC2C2448BF8747A8A58586A45D5FA411C41EF008698E6B42E2D42916F4D7CFE4E7E6EA6E641994E63C3D4CBE9A55D96DA9034452759E76ECEA866C1535BD2C3435624653F9584406FDB6A4746A7B1D04858E603D47F298C591BCD80DD19DC1CDC13DC19461318CBC53D5298EEFA8FBE4E7E6EA6E641994E63C3D4CBE9A55D96DA9034452759E76ECEA866C1535BD2C1DF96810B25185325BDCFB041B9D322685D0E648DF42B882A4734768757488989301758096D0D3AD5F864A2215FC751A8405D83989E38F98CA842FD95D8DE95559C7C2138B28AE7B40E276938432999072E8B9D37AA1631734C982274CF617A763ABDF37DEA9B8A93E660F70FA12CC8F4B9E9682F2FFCB26CA3F2D029925F9A4ACA428C21487F07F5E2D8A822BDA0A72C748CA0C3C8B737D713BC637CCE83D7A18FECEB3377855C950E30F05D81043F1B4A7DE73DCF19668876A3E8526CF7B99276DD7756300F773D1AB66105A8B9ECFA1F040A185FDA41C02EB0A916F917A0744D1B24CFE6FB561AF80FF474C3994C235D4E59E9565FAB483BFAB67CF2600CD5C658795E17280684A5703A42516B89FEA754F3D0A8CB866619A7D2ABA2991075E64657D53F384B123A3F596B6B05B67D734E2279154D7127DE154CDB5263F5E5ABCC0E496616A0E0F034611D02C714F0276D92DE19422DF519034E7554D8CEA" forKey:@"params"];
    
    
//    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    
    [manager POST:URLString parameters:d progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"request success %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"request fail %@", [error localizedDescription]);
    }];



}

@end
