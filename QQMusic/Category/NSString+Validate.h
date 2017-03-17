//
//  NSString+Validate.h
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/17.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

+ (BOOL)valiMobile:(NSString *)mobile;

+ (BOOL) validateUserName:(NSString *)name;


+ (BOOL) validateEmail:(NSString *)email;

+ (BOOL) validatePassword:(NSString *)passWord;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

+ (BOOL) validateNickname:(NSString *)nickname;

+ (BOOL) validateCarNo:(NSString *)carNo;

+ (BOOL) validateCarType:(NSString *)CarType;

@end
