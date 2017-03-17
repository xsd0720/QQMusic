//
//  SecurityUtil.m
//  JKUniversalPlayer
//
//  Created by wany on 16/10/30.
//  Copyright © 2016年 xwmedia01. All rights reserved.
//

#import "SecurityUtil.h"
#import "GTMBase64.h"
#import "NSData+NSData_AES.h"

static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation SecurityUtil


#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString * )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString*)decodeBase64String:(NSString * )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString*)encodeBase64Data:(NSData *)data {
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString*)decodeBase64Data:(NSData *)data {
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSData *)decodeBase64StringToData:(NSString *)input;
{
    NSData *data = [GTMBase64 decodeString:input];
    return data;
}

+ (NSData *)decodeBase64DataToData:(NSData *)data
{
    NSString *ss = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *d = [GTMBase64 decodeString:ss];
    return d;
}

#pragma mark - AES加密
//将string转成带密码的data
+(NSString*)encryptAESData:(NSString*)string app_key:(NSString*)key
{
    //将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密
    NSData *encryptedData = [data AES128EncryptWithKey:key];
//    NSLog(@"加密后的字符串 :%@",[encryptedData base64Encoding]);
    
    return [encryptedData base64EncodedStringWithOptions:0];
}

#pragma mark - AES解密
//将带密码的data转成string
+(NSString*)decryptAESData:(NSData*)data  app_key:(NSString*)key
{
    //使用密码对data进行解密2017@rooting.com
    NSData *decryData = [data AES128DecryptWithKey:key];
    //将解了密码的nsdata转化为nsstring
    NSString *str = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
//    NSLog(@"解密后的字符串 :%@",str);
    return str;
}

+ (NSString *)base64EncodedStringFrom:(NSData *)data
{
    
    if ([data length] == 0)
        
        return @"";
    
    char *characters = malloc((([data length] + 2) / 3) * 4);
    
    if (characters == NULL)
        
        return nil;
    
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    
    while (i < [data length])
        
    {
        
        char buffer[3] = {0,0,0};
        
        short bufferLength = 0;
        
        while (bufferLength < 3 && i < [data length])
            
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        
        if (bufferLength > 1)
            
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        
        else characters[length++] = '=';
        
        if (bufferLength > 2)
            
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        
        else characters[length++] = '=';
        
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
    
}


+ (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
        [NSException raise:NSInvalidArgumentException format:nil];
    
    if ([string length] == 0)
        
        return [NSData data];
    
    static char *decodingTable = NULL;
    
    if (decodingTable == NULL)
        
    {
        
        decodingTable = malloc(256);
        
        if (decodingTable == NULL)
            
            return nil;
        
        memset(decodingTable, CHAR_MAX, 256);
        
        NSUInteger i;
        
        for (i = 0; i < 64; i++)
            
            decodingTable[(short)encodingTable[i]] = i;
        
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    
    if (characters == NULL)     //  Not an ASCII string!
        
        return nil;
    
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    
    if (bytes == NULL)
        
        return nil;
    
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    
    while (YES)
        
    {
        
        char buffer[4];
        
        short bufferLength;
        
        for (bufferLength = 0; bufferLength < 4; i++)
            
        {
            
            if (characters[i] == '\0')
                
                break;
            
            if (isspace(characters[i]) || characters[i] == '=')
                
                continue;
            
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
                
            {
                
                free(bytes);
                
                return nil;
                
            }
            
        }
        
        if (bufferLength == 0)
            
            break;
        
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
            
        {
            
            free(bytes);
            
            return nil;
            
        }
        
        //  Decode the characters in the buffer to bytes.
        
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        
        if (bufferLength > 2)
            
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        
        if (bufferLength > 3)
            
            bytes[length++] = (buffer[2] << 6) | buffer[3];
        
    }
    
    bytes = realloc(bytes, length);
    
    return [NSData dataWithBytesNoCopy:bytes length:length];
    
}

@end
