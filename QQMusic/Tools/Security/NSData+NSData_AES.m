//
//  NSData+NSData_AES.m
//  JKUniversalPlayer
//
//  Created by wany on 16/10/30.
//  Copyright © 2016年 xwmedia01. All rights reserved.
//

#import "NSData+NSData_AES.h"

#import <CommonCrypto/CommonCryptor.h>
#define gIv @"0102030405060708" //可以自行定义16位

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


//DES加密

- (NSString *)encryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)ivDes

{
    
    if ((sText == nil || sText.length == 0)
        
        || (sText == nil || sText.length == 0)
        
        || (ivDes == nil || ivDes.length == 0)) {
        
        return @"";
        
    }
    
    //gb2312 编码
    
    NSStringEncoding encoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSData* encryptData = [sText dataUsingEncoding:encoding];
    
    size_t  dataInLength = [encryptData length];
    
    const void *   dataIn = (const void *)[encryptData bytes];
    
    CCCryptorStatus ccStatus = nil;
    
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    
    size_t dataOutMoved = 0;
    
    size_t    dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);  dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0
    
    const void *iv = (const void *) [ivDes cStringUsingEncoding:NSASCIIStringEncoding];
    
    //CCCrypt函数 加密/解密
    
    ccStatus = CCCrypt(kCCEncrypt,//  加密/解密
                       
                       kCCAlgorithmDES,//  加密根据哪个标准（des，3des，aes。。。。）
                       
                       kCCOptionPKCS7Padding,//  选项分组密码算法(des:对每块分组加一次密  3DES：对每块分组加三个不同的密)
                       
                       [key UTF8String],  //密钥    加密和解密的密钥必须一致
                       
                       kCCKeySizeDES,//   DES 密钥的大小（kCCKeySizeDES=8）
                       
                       iv, //  可选的初始矢量
                       
                       dataIn, // 数据的存储单元
                       
                       dataInLength,// 数据的大小
                       
                       (void *)dataOut,// 用于返回数据
                       
                       dataOutAvailable,
                       
                       &dataOutMoved);
    
    //编码 base64
    
    NSData *data = [NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved];
    
    
    
    Byte *bytes = (Byte *)[data bytes];
    
    //下面是Byte 转换为16进制。
    
    NSString *hexStr=@"";
    
    for(int i=0;i<[data length];i++){
        
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        
    }
    
    
    free(dataOut);
    
    return hexStr;
    
}

//DES解密

- (NSString *)decryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv

{
    
    if ((sText == nil || sText.length == 0)
        
        || (sText == nil || sText.length == 0)
        
        || (iv == nil || iv.length == 0)) {
        
        return @"";
        
    }
    
    const void *dataIn;
    
    size_t dataInLength;
    
    char *myBuffer = (char *)malloc((int)[sText length] / 2 + 1);
    
    bzero(myBuffer, [sText length] / 2 + 1);
    
    for (int i = 0; i < [sText length] - 1; i += 2) {
        
        unsigned int anInt;
        
        NSString * hexCharStr = [sText substringWithRange:NSMakeRange(i, 2)];
        
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        
        myBuffer[i / 2] = (char)anInt;
        
    }
    
    NSData *decryptData =[NSData dataWithBytes:myBuffer length:[sText length] / 2 ];//转成utf-8并decode
    
    dataInLength = [decryptData length];
    
    dataIn = [decryptData bytes];
    
    free(myBuffer);
    
    CCCryptorStatus ccStatus = nil;
    
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    
    size_t dataOutAvailable = 0; //size_t  是操作符sizeof返回的结果类型
    
    size_t dataOutMoved = 0;
    
    dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    
    dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0
    
    const void *ivDes = (const void *) [iv cStringUsingEncoding:NSASCIIStringEncoding];
    
    //CCCrypt函数 加密/解密
    
    ccStatus = CCCrypt(kCCDecrypt,//  加密/解密
                       
                       kCCAlgorithmDES,//  加密根据哪个标准（des，3des，aes。。。。）
                       
                       kCCOptionPKCS7Padding,//  选项分组密码算法(des:对每块分组加一次密  3DES：对每块分组加三个不同的密)
                       
                       [key UTF8String],  //密钥    加密和解密的密钥必须一致
                       
                       kCCKeySizeDES,//   DES 密钥的大小（kCCKeySizeDES=8）
                       
                       ivDes, //  可选的初始矢量
                       
                       dataIn, // 数据的存储单元
                       
                       dataInLength,// 数据的大小
                       
                       (void *)dataOut,// 用于返回数据
                       
                       dataOutAvailable,
                       
                       &dataOutMoved);
    
    NSStringEncoding encoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString *result  = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved] encoding:encoding];
    
    free(dataOut);
    
    return result;
    
}


@end
