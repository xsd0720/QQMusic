//
//  QMLeftMenuViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMLeftMenuViewController.h"

#define CELLIDENTIFIER      @"CELLIDENTIFIER"

@interface QMLeftMenuViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation QMLeftMenuViewController


- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        
        [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLIDENTIFIER];
    }
    return _listTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self setUpNav];
    [self setUpSubView];
}

- (void)setUpNav
{
    self.view.backgroundColor = [UIColor blueColor];
}


- (void)setUpSubView
{
    
    self.datasource = @[@"仅Wi-Fi联网", @"简洁模式", @"定时关闭", @"免流量服务", @"传歌到手机", @"QPlay与车载音乐", @"清理占用空间", @"关于QQ音乐"];
    [self.view addSubview:self.listTableView];
}


#pragma mark -----
#pragma mark -----     ListTableView Delegates ---------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER forIndexPath:indexPath];
    cell.textLabel.text = self.datasource[indexPath.row];
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
