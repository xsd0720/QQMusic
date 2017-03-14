//
//  QMDataSourceTool.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/14.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMDataSourceTool.h"
#import "GDataXMLNode.h"
@implementation QMDataSourceTool

+ (void)start
{
    [self check:@"andljaldhttp://wwww.baidu.com?key=123c=abc.mp4ddddd"];
    
    //    [QMHttpTool GET:@"https://y.qq.com" parameters:nil success:^(id responsObject) {
//        NSLog(@"%@", responsObject);
//        
//        GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithData:responsObject options:0 error:nil];
//        
//    } failure:^(NSError *error) {
//        NSLog(@"%@", [error localizedDescription]);
//    }];
}

+ (void)check:(NSString *)str
{

//    NSString *regex = @"'(http.*\.mp4)'";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    BOOL isValid = [predicate evaluateWithObject:str];

    //1.建立正则表达式的匹配
        NSString *pattern =  @"'(http.*\.mp4)'";
    
//    int asciiCode = 8197;
//    NSString *string = [NSString stringWithFormat:@"%c", asciiCode];
//    
//    NSString *pattern = [NSString stringWithFormat:@"@([^%@]+)(%@)",string,string];
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:kNilOptions error:nil];
    
    
    //2.将满足正则表达式的字段挑出来
    NSArray *match = [regex matchesInString:str
                                    options:NSMatchingReportCompletion
                                      range:NSMakeRange(0, [str length])];

    
    if(match.count != 0)
    {
        for (NSTextCheckingResult *matc in match)
        {
            NSRange range = [matc range];
            NSLog(@"%@", [str substringWithRange:range]);
        }
    }


}

@end
