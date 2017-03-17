//
//  NSString+Category.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/16.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (NSString *)stringByReversed
{
    NSMutableString *s = [NSMutableString string];
    for (NSUInteger i=self.length; i>0; i--) {
        [s appendString:[self substringWithRange:NSMakeRange(i-1, 1)]];
    }
    return s;
}


- (NSString *)zfill:(NSInteger)size
{
    NSInteger number = size-self.length;
    if (number<=0) {
        return self;
    }
    NSMutableString *string = [[NSMutableString alloc] init];
    for (int i=0; i< number; i++) {
        [string appendString:@"0"];
    }
    
    NSString *resultString = [NSString stringWithFormat:@"%@%@", string, self];
    return resultString;
}

- (uint64_t)integerValueFromHex
{
    unsigned int hexInt;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&hexInt];
    return hexInt;
}

- (NSData *)bytesFromHexString
{
    uint64_t total = 0;
    
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= self.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [self substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        NSLog(@"%i", intValue);
        total+=intValue;
        [data appendBytes:&intValue length:1];
    }
    return data;
    
}



+ (NSString *)hexStringForData:(NSData *)data
{
    if (data == nil) {
        
        return nil;
    }
    NSMutableString* hexString = [NSMutableString string];

    const unsigned char *p = [data bytes];

    for (int i=0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    return hexString;
    
}


+ (NSString*)hexStringForChar:(unsigned char *)data len:(int)len

{
    
    if (len == 0) {
        
        return nil;
        
    }
    
    
    
    NSMutableString* hexString = [NSMutableString string];
    
    
    
    const unsigned char *p = data;
    
    
    
    for (int i=0; i < len; i++) {
        
        [hexString appendFormat:@"%02x", *p++];
        
    }
    
    return hexString;
    
}



+ (NSData *)dataForHexString:(NSString*)hexString
{
    if (hexString == nil) {
        return nil;
    }

    const char* ch = [[hexString lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableData* data = [NSMutableData data];
    while (*ch) {
        
        if (*ch == ' ') {
            
            continue;
            
        }
        
        char byte = 0;
        
        if ('0' <= *ch && *ch <= '9') {
            
            byte = *ch - '0';
            
        }
        
        else if ('a' <= *ch && *ch <= 'f') {
            
            byte = *ch - 'a' + 10;
            
        }
        
        else if ('A' <= *ch && *ch <= 'F') {
            
            byte = *ch - 'A' + 10;
            
        }
        
        ch++;
        
        byte = byte << 4;
        
        if (*ch) {
            
            if ('0' <= *ch && *ch <= '9') {
                
                byte += *ch - '0';
                
            } else if ('a' <= *ch && *ch <= 'f') {
                
                byte += *ch - 'a' + 10;
                
            }
            
            else if('A' <= *ch && *ch <= 'F')
                
            {
                
                byte += *ch - 'A' + 10;
                
            }
            
            ch++;
            
        }
        
        [data appendBytes:&byte length:1];
        
    }
    
    return data;
    
}

@end
