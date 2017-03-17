//
//  NuRSAKey.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/8.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "NuRSAKey.h"

@interface NuRSAKey()

@property (nonatomic) const char *modulus;

@property (nonatomic) const char *exponent;

@property (nonatomic) const void *key;

@end

@implementation NuRSAKey

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithModulus:(NSString *)modulus exponent:(NSString *)exponent
{
    self = [super init];
    if (self) {
        self.modulus = [modulus cStringUsingEncoding:NSUTF8StringEncoding];
        self.exponent =  [exponent cStringUsingEncoding:NSShiftJISStringEncoding];
    }
    return self;
}

- (instancetype)initWithModulusData:(NSData *)modulusData exponentData:(NSData *)exponentData
{
    self = [super init];
    if (self) {
        if (modulusData) {
           self.key = [modulusData bytes];
        }
        if (exponentData) {
            self.key = [exponentData bytes];
        }
    }
    return self;
}

- (instancetype)initWithPEMPrivateKeyData:(NSData *)keyData
{
    self = [super init];
    if (self) {
        self.key = [keyData bytes];
    }
    return self;
}

- (instancetype)initWithPEMPublicKeyData:(NSData *)keyData
{
    self = [super init];
    if (self) {
        self.key = [keyData bytes];
    }
    return self;
}


- (instancetype)initWithDERPublicKeyData:(NSData *)keyData
{
    self = [super init];
    if (self) {
        self.key = [keyData bytes];
    }
    return self;
}

@end
