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
@end
