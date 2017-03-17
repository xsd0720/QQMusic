//
//  NSData+NSData_AES.h
//  JKUniversalPlayer
//
//  Created by wany on 16/10/30.
//  Copyright © 2016年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NSData_AES)
- (NSData *)AES128EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES128DecryptWithKey:(NSString *)key;   //解密

- (NSString *)encryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)ivDes;  //DES加密
- (NSString *)decryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv;  //DES解密

@end
