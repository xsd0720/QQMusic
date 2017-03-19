//
//  NSObject+Category.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKBigInteger.h"
@interface NSObject (Category)

- (NSString *)toString:(id)object;

- (JKBigInteger *)vint:(NSString *)hexStr base:(int)base;

+ (uint64_t)powMod:(uint64_t)a b:(uint64_t)b c:(uint64_t)c;
@end
