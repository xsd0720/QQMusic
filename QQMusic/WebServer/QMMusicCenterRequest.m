//
//  QMMusicCenterRequest.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/16.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMusicCenterRequest.h"
#import "SecurityUtil.h"
#import "JKBigInteger.h"

static NSString *MODULUS =  @"00e0b509f6259df8642dbc35662901477df22677ec152b5ff68ace615bb7b725152b3ab17a876aea8a5aa76d2e417629ec4ee341f56135fccf695280104e0312ecbda92557c93870114af6c9d05c4f7f0c3685b7a46bee255932575cce10b424d813cfe4875d3e82047b97ddef52741d546b8e289dc6935b3ece0462db0a22b8e7";

static NSString *NONCE =  @"0CoJUm6Qyw8W8jud";

static NSString *PUBKEY =  @"010001";


@implementation QMMusicCenterRequest



+ (QMMusicCenterRequest *)sharedRequest
{
    
    static QMMusicCenterRequest *centerRequest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        centerRequest = [[self alloc]init];
    });
    
    return centerRequest;
}


+ (void)loginWithUserName:(NSString *)userName
                 password:(NSString *)password
                  success:(QMHttpToolSuccessBlock)success
                  failure:(QMHttpToolFailBlock)failure
{
    if (![NSString valiMobile:userName]) {
        return;
    }
    
    NSString *requsetURL = @"https://music.163.com/weapi/login/cellphone";
    NSDictionary *params = @{@"phone":userName, @"password":password, @"rememberLogin":@"true"};
    params = [[QMMusicCenterRequest sharedRequest] encrypted_request:params];
    
    [QMHttpTool POST:requsetURL parameters:params success:^(id responsObject) {
        success(responsObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)getArtistListWithoffset:(int)offset total:(BOOL)total limit:(int)limit
                        success:(QMHttpToolSuccessBlock)success
                        failure:(QMHttpToolFailBlock)failure
{
    NSString *requestURLStr = [NSString stringWithFormat: @"http://music.163.com/api/artist/top?offset=%i&total=%i&limit=%i", offset, total, limit];
    
    [QMHttpTool GET:requestURLStr parameters:nil success:^(id responsObject) {
        if ([responsObject isKindOfClass:[NSDictionary class]]) {
            success(responsObject);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

//params:2VrMwZttyQVN2NMsHPMzNAXU9Z/uOn1JJvegGlj43VZsnZ7EFZy7Zj0AYIYxD3xHe2VaeVw2XV8gB6aTYiOyEcYUmi09OYk4273iwTPGMY4YuK8T9Y5s/AEUvOyUoWSD+7N7YogPaPNOz0gdxIz0aQ==
//encSecKey:d2dcc7c09fce3535a380d961f7551ab4309d861e82d737116117335d47e927a84538dbda433cfa3dd310b11e052da7b01798465e49f291c6aa59df6cdf8c88c908effce5b57d34456507713ff3d1ee1976a080e882f224cc0e0e071f1b6081026ed555994902cddcdc59c4b6d9eb805e38249ce7837fb6d62f130b0c61bf111e
//test id  418603077  告白气球
+ (void)songs_detail_new_api:(NSArray *)music_ids
                     success:(QMHttpToolSuccessBlock)success
                     failure:(QMHttpToolFailBlock)failure
{
    NSString *requestURLStr = @"http://music.163.com/weapi/song/enhance/player/url?csrf_token=";
    NSDictionary *params = @{@"ids" : music_ids, @"br" : @"320000", @"csrf_token" : @""};
    params = [[QMMusicCenterRequest sharedRequest] encrypted_request:params];
    
    
    [QMHttpTool POST:requestURLStr parameters:params success:^(id responsObject) {
        success(responsObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)getSongLyric:(NSString *)musicId
             success:(QMHttpToolSuccessBlock)success
             failure:(QMHttpToolFailBlock)failure
{
    NSString *requestURLStr = [NSString stringWithFormat:@"http://music.163.com/api/song/lyric?os=osx&id=%@&lv=-1&kv=-1&tv=-1", musicId];
    [QMHttpTool GET:requestURLStr parameters:nil success:^(id responsObject) {
        success(responsObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

+ (void)getSongDetail:(NSArray *)music_ids
              success:(QMHttpToolSuccessBlock)success
              failure:(QMHttpToolFailBlock)failure
{
    NSString *requestURLStr = @"http://music.163.com/weapi/v3/song/detail?csrf_token=";
    
    NSString *params = @"2VrMwZttyQVN2NMsHPMzNAXU9Z/uOn1JJvegGlj43VZsnZ7EFZy7Zj0AYIYxD3xHe2VaeVw2XV8gB6aTYiOyEcYUmi09OYk4273iwTPGMY4YuK8T9Y5s/AEUvOyUoWSD+7N7YogPaPNOz0gdxIz0aQ==";
    NSString *encSecKey = @"d2dcc7c09fce3535a380d961f7551ab4309d861e82d737116117335d47e927a84538dbda433cfa3dd310b11e052da7b01798465e49f291c6aa59df6cdf8c88c908effce5b57d34456507713ff3d1ee1976a080e882f224cc0e0e071f1b6081026ed555994902cddcdc59c4b6d9eb805e38249ce7837fb6d62f130b0c61bf111e";
    
    
    [QMHttpTool POST:requestURLStr parameters:@{@"params":params, @"encSecKey":encSecKey} success:^(id responsObject) {
        success(responsObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    
}
- (NSString *)createSecretKey
{
    NSArray *randomPool = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];

    NSMutableString *secretKey = [[NSMutableString alloc] init];
    
    for (int x = 0; x<16; x++) {
        NSInteger random = arc4random()%randomPool.count;
        NSString *randomString = [randomPool objectAtIndex:random];
        [secretKey appendString:randomString];
    }
    return secretKey;
}

- (NSDictionary *)encrypted_request:(NSDictionary *)params
{
    NSString *jsonParamas = [params toString:params];
    NSString *secKey = [self createSecretKey];
    NSString *firstAes = [SecurityUtil encryptAESData:jsonParamas app_key:NONCE];
    NSString *encText = [SecurityUtil encryptAESData:firstAes app_key:secKey];
    NSString *encSecKey = [self rsaEncrypt:secKey pubKey:PUBKEY modulus:MODULUS];
    NSDictionary *data = @{@"params":encText, @"encSecKey":encSecKey};
    return data;
}



- (NSString *)rsaEncrypt:(NSString *)secKey pubKey:(NSString *)pubKey modulus:(NSString *)modulus
{
    secKey = [secKey stringByReversed];
    secKey = [self hexStringFromString:secKey];

    JKBigInteger *secKeyInt = [self vint:secKey base:16];
    JKBigInteger *pubKeyInt = [self vint:pubKey base:16];
    JKBigInteger *modulusInt = [self vint:modulus base:16];
    JKBigInteger *rsBigInteger = [secKeyInt pow:pubKeyInt andMod:modulusInt];
    NSString *rs = [self bighexStringFromString:rsBigInteger];
    return [rs zfill:256];
}

- (NSString *)bighexStringFromString:(JKBigInteger *)bigInterger
{
    unsigned int numBytesInt5 = [bigInterger countBytes];
    unsigned char bytes[numBytesInt5];
    
    [bigInterger toByteArrayUnsigned:bytes];
    
    NSString *hexStr=@"";
    
    for(unsigned i = 0; i < numBytesInt5; i++)
    {
//        NSLog(@"Byte %d: %X", i, bytes[i]);
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    
    }
    
    return hexStr;

}

- (NSString *)hexStringFromString:(NSString *)string{
    

    
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr]; 
    } 
    return hexStr; 
}

@end
