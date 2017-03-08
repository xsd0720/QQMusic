//
//  SecurityUtil.h
//  JKUniversalPlayer
//
//  Created by wany on 16/10/30.
//  Copyright © 2016年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityUtil : NSObject
#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;

+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;

+ (NSData *)decodeBase64StringToData:(NSString *)input;
+ (NSData *)decodeBase64DataToData:(NSData *)data;

#pragma mark - AES加密
//将string转成带密码的data
+ (NSString*)encryptAESData:(NSString*)string app_key:(NSString*)key ;
//将带密码的data转成string
+(NSString*)decryptAESData:(NSData*)data app_key:(NSString*)key ;
@end
