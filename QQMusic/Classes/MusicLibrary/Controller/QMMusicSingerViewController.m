//
//  QMMusicSingerViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/20.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMusicSingerViewController.h"
#import "BETouchView.h"
#import "SingerCell.h"

#define CELLIDENFTIFER @"CELLIDENFTIFER"

@interface QMMusicSingerViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *singerTableView;

@end

@implementation QMMusicSingerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpSubView];
    
}

- (void)setUpSubView
{
    self.singerTableView = [[UITableView alloc] initWithFrame:HASNAV_RECT style:UITableViewStylePlain];
    self.singerTableView.dataSource = self;
    self.singerTableView.delegate = self;
    [self.singerTableView registerClass:[SingerCell class] forCellReuseIdentifier:CELLIDENFTIFER];
    [self.view addSubview:self.singerTableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingerCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENFTIFER forIndexPath:indexPath];
    cell.textLabel.text = @"薛之谦";
    return cell;
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
