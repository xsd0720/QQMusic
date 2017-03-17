//
//  NSObject+Category.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

- (NSString *)toString:(id)object
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    NSString *jsonString = @"";
    
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }else
    {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return jsonString;
}

- (JKBigInteger *)vint:(NSString *)hexStr base:(int)base;
{
    hexStr = [hexStr stringByReversed];
    
    JKBigInteger *totoalBig = [[JKBigInteger alloc] initWithString:@"0"];
    
    JKBigInteger *hex16 = [[JKBigInteger alloc] initWithString:[NSString stringWithFormat:@"%i", base]];
    
    NSString *temp;
    for (int i=0; i< hexStr.length; i++) {
        temp = [hexStr substringWithRange:NSMakeRange(i, 1)];
        int number = (int)strtoul([temp UTF8String], 0, 16);
        JKBigInteger *bigNumber = [[JKBigInteger alloc] initWithString:[NSString stringWithFormat:@"%i", number]];
        
        totoalBig = [totoalBig add:[[hex16 pow:i] multiply:bigNumber]];
    }
    
    return totoalBig;
}

@end
