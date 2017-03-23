//
//  QMCaptureTool.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/15.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMCaptureTool.h"
#import "GCDAsyncUdpSocket.h"
#import "SecurityUtil.h"
#include <sys/sysctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>

#include <net/if.h>
#include <net/if_dl.h>

#import <arpa/inet.h>

@interface QMCaptureTool()<GCDAsyncUdpSocketDelegate>

@property (nonatomic, strong)  GCDAsyncUdpSocket *asycUdpSocket;

@property (nonatomic) NSString *networkInterface;

@end

@implementation QMCaptureTool

- (NSDictionary *)availableNetworkInterfaces {
    NSMutableDictionary *addresses = [NSMutableDictionary dictionary];
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *ifa = NULL;
    
    // retrieve the current interfaces - returns 0 on success
    if( getifaddrs(&interfaces) == 0 ) {
        for( ifa = interfaces; ifa != NULL; ifa = ifa->ifa_next ) {
            if( (ifa->ifa_addr->sa_family == AF_INET) && !(ifa->ifa_flags & IFF_LOOPBACK) && !strncmp(ifa->ifa_name, "en", 2)) {
                NSData *data = [NSData dataWithBytes:ifa->ifa_addr length:sizeof(struct sockaddr_in)];
                NSString *if_name = [NSString stringWithUTF8String:ifa->ifa_name];
                [addresses setObject:data forKey:if_name];
            }
        }
        
        freeifaddrs(interfaces);
    }
    
    return addresses;
}


- (void)_notifyDelegateWithError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        @autoreleasepool {
            NSLog(@"%@", error);
        }
    });
}

//9B1595479B79266065903BA79E98830204DBB938E4350900ECE4E210DB79554AA30606F080800B9AAE3CBBD396C5129DA63548714B664F070444DBC7740E409E84AB1ED3E54A569B278DEAEBA769726D00661683163C22FA6C1822607CC42B2CCABCFDF6E55DF38FF795B08F21629A665ED5B8458CFBDB3CDD80E5F8EB0915B3A2F6316587FF37CCF181E2D629AD34AFEDF20C617CCC7D6E7A066CC3EC6FED65C41E0EB98D63B74E3845FFD9BC6D695D14EE5403072997606BB117A03FDDF4FBDE384E09920F0AFD843EEFE1A63418BD38B394E97FBBE0E4CBA65C27BC174C4D5213D6A4291624703FC67326DC5254915253ECA09D7FC464AB5803B38AF700AF83C858106745F634F6D0C9EBF544C2F40BC438B3125F082048464C81AA03B311D4B8DA297A3914204BBF4558E9E2C3046CEBE6E2A8980248051040581DEC23BC6F0B27C2266E75FCE98D66D70E1D461B610B82ED4425B774A3518C91559A71E1CE95811FBE131F419D0F5EB54FC461FA9F0F338FBE810217C7877CA1C9CACB6E8CD7979951D3E57B556222769C6E4DF788B0785BE3DCDC209A863D92C6D15A1C8DB6060FE36C9DB905AAC30FF7E89319776D49887F80110AD1851C1AE82AFD6C95CEA6D8C4ED7FE50F9B2C1C1CD331CC76A11A74F5F4F52F979162E792753D78BD4B35F3B4942DEBBAF4D58661AEAAB36C7FDA248BE5220FF75F9453F2B0A700592ADA49DBBB5FA106947B1420D62C5BC833856CE7693EDB5687F7DB816397FE2FF50BA8FFC618AFEB958A785F3BA1501ABE3F117C96D989025513FC20FF8EA5A59320ADC75D74A6B830B426294207F83C03068680598619DD2A7043579105086CF1EA12AF13DDB5CFE17ED1B37B0D1264648BF3D9DA8C0AF3D3FBDF582E55079B13F34AFEC3DA8E69251F8EB21D1A113CCBD50AF304DE2449022D99BE40C5B6B09E90747DD3CD729D7F94C521D8B0D4B6A27106D6C6223DBCC49EC284E67DBB


- (void)startListen
{
//    NSString *key = @"Lu6b7o0O2/6/51Xw6alR7Q==";/song\?id=(\d+)
//    NSString *willOpen = @"A1oHbKfR+L5ltdc79Q8v/d6MstIsazs+IEvl3A9mGItHqqEvsjkKNjr5VrjKsrtkZoUvOJziwo06O7G8I64d9i94wgNOIljLIsA4UWi3iDPvkyRwxKpjwGiOtS1FW7Ir";
//    
//  NSData *xx = [SecurityUtil decodeBase64StringToData:willOpen];
//    
//    NSString *sxix = [[NSString alloc] initWithData:xx encoding:NSUTF8StringEncoding];
//    
//    
//    NSData *willOpenData = [willOpen dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
// NSData *dd =  [SecurityUtil decryptAESData:xx app_key:@"Lu6b7o0O2/6/51Xw6alR7Q=="];
//    
//    
//    
//   NSString *s =[SecurityUtil decodeBase64String:willOpen];
//    
//    
//// NSString *ssss =  [Helper decryptWithDESString:willOpen key:key andiV:@"0102030405060708"];
//    NSData *aedb = [Helper AES128DecryptWithKey:key iv:@"0102030405060708" withNSData:xx];
//    aedb = [Helper AES128DecryptWithKey:key iv:@"0102030405060708" withNSData:aedb];
    
    
    
    
//params:A1oHbKfR+L5ltdc79Q8v/d6MstIsazs+IEvl3A9mGItHqqEvsjkKNjr5VrjKsrtkZoUvOJziwo06O7G8I64d9i94wgNOIljLIsA4UWi3iDPvkyRwxKpjwGiOtS1FW7Ir
//encSecKey:8b4a052a825ffc7498d8c7842b49a4d1c8500a1a11fb820806105c017b12b04704079657204394b3837d5e25c5083aa9ed22ed4f001d3ca413c4653ccde087ce927066e4abbfb0007eab35650beb7ed0ac5d5f1f2d92e9103fdda510231036d1455649af0fcf0fc43835dbbbcfabf09332884c9ec465db6dec7291bec5b2a9a2
    
    
    

    
    
//    
//    _asycUdpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
//    [_asycUdpSocket enableBroadcast:YES error:nil];
//
//  
//
//    NSError *error;
//    NSDictionary *interfaces = [self availableNetworkInterfaces];
//    NSData *sourceAddress = _networkInterface? [interfaces objectForKey:_networkInterface] : nil;
//    if( !sourceAddress ) sourceAddress = [[interfaces allValues] firstObject];
////
//        if(![_asycUdpSocket bindToAddress:sourceAddress error:&error]) {
//            [self _notifyDelegateWithError:error];
//            return;
//        }
//
//
//

//    if(![_asycUdpSocket bindToPort:80 error:&error]) {
//        [self _notifyDelegateWithError:error];
//        return;
//    }
//
//    //加入组播组
//    if(![_asycUdpSocket joinMulticastGroup:@"127.0.0.1" error:&error]) {
//        [self _notifyDelegateWithError:error];
//        return;
//    }
////
//    if(![_asycUdpSocket beginReceiving:&error]) {
//        [self _notifyDelegateWithError:error];
//        return;
//    }
//
//    NSString *request=@"quick_stat";
//    
//    NSData *data=[NSData dataWithData:[request dataUsingEncoding:NSASCIIStringEncoding] ];
////    [_asycUdpSocket sendData:data withTimeout:<#(NSTimeInterval)#> tag:<#(long)#>
//    
//     
//    [ _asycUdpSocket sendData:data toHost:@"255.255.255" port:80 withTimeout:-1 tag:1];

}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag
{
    
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext
{
    NSLog(@"=======");
}

- (void)stopListen
{
    
}

@end
