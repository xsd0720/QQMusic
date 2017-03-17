//
//  QMDataSourceTool.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/14.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMDataSourceTool.h"

@implementation QMDataSourceTool

+ (void)start
{
   
    
//   [QMHttpTool GET:@"http://music.163.com/api/artist/top?offset=0&total=false&limit=100" parameters:nil success:^(id responsObject) {
//        NSLog(@"%@", responsObject);
//       NSLog(@"receive data");
//    } failure:^(NSError *error) {
//        NSLog(@"%@", [error localizedDescription]);
//    }];
}

+ (void)checkMp4:(NSString *)str
{

    //1.建立正则表达式的匹配
        NSString *pattern =  @"(http.*?(\\.mp4))";
    

    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:kNilOptions error:nil];
    
    
    //2.将满足正则表达式的字段挑出来
    NSArray *match = [regex matchesInString:str
                                    options:NSMatchingReportProgress
                                      range:NSMakeRange(0, [str length])];

    
    if(match.count != 0)
    {
        for (NSTextCheckingResult *matc in match)
        {
            NSRange range = [matc range];
            NSLog(@"%@ \n", [str substringWithRange:range]);
           
        }
    }

}

@end
