//
//  NSData+NSData_AES.m
//  JKUniversalPlayer
//
//  Created by wany on 16/10/30.
//  Copyright © 2016年 xwmedia01. All rights reserved.
//

#import "NSData+NSData_AES.h"

#import <CommonCrypto/CommonCryptor.h>
#define gIv @"xxxxxxxxxxx" //可以自行定义16位

@implementation NSData (NSData_AES)
//(key和iv向量这里是16位的) 这里是CBC加密模式，安全性更高

- (NSData *)AES128EncryptWithKey:(NSString *)key//加密
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
     void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}


- (NSData *)AES128DecryptWithKey:(NSString *)key//解密
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

//http://blog.csdn.net/autom_lishun/article/details/52586429
- (NSString*)desEncode:(NSString *)originStr key:(NSString *)key
{
    // 1, 将 str装换成 base64数据
    NSData * baseData =[originStr dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    size_t dataOutOffset = 0;
    
    NSUInteger dataLength = baseData.length + 10 +[key dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES].length;
    unsigned char buffer[dataLength];
    memset(buffer, 0,sizeof(char));
    
    CCCryptorStatus cryptorStatus=CCCrypt( kCCEncrypt,        // 解密还是解密
                                          kCCAlgorithmDES,  // 加密的方式 DES， 3DES
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String],  //
                                          kCCKeySizeDES,    // kCCKeySizeDES
                                          nil,               //
                                          [baseData bytes],  //
                                          [baseData length], //
                                          buffer,             // 注意接收加密的buffer的大小
                                          dataLength,         //
                                          &dataOutOffset      //
                                          );
    NSString * encoding=nil;
    if (cryptorStatus == 0) {
        NSData * data = [NSData dataWithBytes:buffer length:dataOutOffset];
        encoding = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        NSLog(@"加密后的串：[%@]", encoding);
    }else
        NSLog(@"DES加密失败！%d",cryptorStatus);
    return encoding;
}


- (NSString *)DesEncoding:(NSString *)baseStr key:(NSString*)key
{
    NSData * baseData =  [[NSData alloc] initWithBase64EncodedString:baseStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSUInteger dataLength = baseData.length+100; // 注意key 与data 的长度
    char buffer[dataLength];
    memset(buffer, 0,sizeof(char));
    size_t dataOffset = 0;
    CCCryptorStatus status =CCCrypt(kCCDecrypt,
                                    kCCAlgorithmDES,
                                    kCCOptionPKCS7Padding|kCCOptionECBMode,
                                    [key UTF8String],
                                    kCCKeySizeDES,
                                    nil,
                                    [baseData bytes],
                                    [baseData length],
                                    buffer,
                                    dataLength,
                                    &dataOffset
                                    );
    
    NSString * decodingStr =nil;
    if (status == 0) {
        NSData * data = [[NSData alloc]initWithBytes:buffer length:dataOffset];
        //        decodingStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        decodingStr =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"解密后的传：[%@]", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }
    else
        NSLog(@"解密失败；");
    return decodingStr;
}


@end
