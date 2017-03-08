//
//  QMMineViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMineViewController.h"
#import "QMHttpTool.h"
#import <ReplayKit/ReplayKit.h>
@interface QMMineViewController ()

@end

@implementation QMMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];

//    
//    NSString *xmlStr = @"<root><uid>3826545319</uid><sid>201703071804273826545319</sid><v>90</v><cv>70100</cv><ct>1</ct><OpenUDID>23092D0AA36848C4B065F662736FB991</OpenUDID><mcc>460</mcc><mnc>01</mnc><chid>001</chid><webp>0</webp><gray>0</gray><patch>110</patch><jailbreak>0</jailbreak><nettype>2</nettype><qq>1152921504621561594</qq><wxopenid>oWvuLjlpZtnr_tjzvkgjGQvXPAdQ</wxopenid><wxrefresh_token>ot1g4wY-kJMK9aUFgY7sB45BqwTaS9eFpqSOlECB6ZK1DDuhHYUUv19OyCP6p92xuCd1-0l0NR0_BjQKxnhReqOFBcNPvLo-tl1BE-XlwoQ</wxrefresh_token><authst>856</authst><cid>293</cid></root>";
//
//    
//    [QMHttpTool POST:@"http://music.163.com/eapi/ios/noticeswitch/cpy/get" parameters:nil success:^(NSDictionary *responsObject) {
//        
//    } failure:^(NSError *error) {
//        
//    }];
//    
    
    
//    <root>
//    <uid>3826545319</uid>
//    <sid>201703081417173826545319</sid>
//    <v>90</v>
//    <cv>70100</cv>
//    <ct>1</ct>
//    <OpenUDID>23092D0AA36848C4B065F662736FB991</OpenUDID>
//    <mcc>460</mcc>
//    <mnc>01</mnc>
//    <chid>001</chid>
//    <webp>0</webp>
//    <gray>0</gray>
//    <patch>110</patch>
//    <jailbreak>0</jailbreak>
//    <nettype>2</nettype>
//    <qq>1152921504621561594</qq>
//    <wxopenid>oWvuLjlpZtnr_tjzvkgjGQvXPAdQ</wxopenid>
//    <wxrefresh_token>ot1g4wY-kJMK9aUFgY7sB45BqwTaS9eFpqSOlECB6ZK1DDuhHYUUv19OyCP6p92xuCd1-0l0NR0_BjQKxnhReqOFBcNPvLo-tl1BE-XlwoQ</wxrefresh_token>
//    <authst>3F91FBEAA2EBF20E7EDD789F0145931AE0A856CF8B95D5679EB7BBAAF97073B7</authst>
//    <cid>293</cid> 
//    </root>
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
