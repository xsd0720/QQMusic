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
//    [QMHttpTool POST:@"http://music.163.com/eapi/ios/noticeswitch/cpy/get" parameters:nil success:^(NSDictionary *responsObject) {
//        
//    } failure:^(NSError *error) {
//        
//    }];
    
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
