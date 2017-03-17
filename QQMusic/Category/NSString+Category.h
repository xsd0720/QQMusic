//
//  NSString+Category.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/16.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

- (NSString *)stringByReversed;

- (NSString *)zfill:(NSInteger)size;

- (uint64_t)integerValueFromHex;

- (NSData *)bytesFromHexString;

- (NSString *)hexStringForData:(NSData *)data;

@end
