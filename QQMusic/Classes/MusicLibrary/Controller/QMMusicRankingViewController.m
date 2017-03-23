//
//  QMMusicRankingViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/21.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMusicRankingViewController.h"
#import "QMMusicRankingListViewController.h"
#define RANKING_CELL_IDENTIFIER   @"RANKING_CELL_IDENTIFIER"

@interface QMMusicRankingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *rankingTableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation QMMusicRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpDataSource];
    
    [self setUpSubview];
    
}

- (void)setUpDataSource
{
    self.dataSource = LDS.rankesResponse[@"items"];
}

- (void)setUpSubview
{
    self.rankingTableView = [[UITableView alloc] initWithFrame:HASNAV_RECT style:UITableViewStylePlain];
    self.rankingTableView.dataSource = self;
    self.rankingTableView.delegate = self;
    [self.rankingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RANKING_CELL_IDENTIFIER];
    [self.view addSubview:self.rankingTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RANKING_CELL_IDENTIFIER forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row][@"name"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.dataSource[indexPath.row];
    
    QMMusicRankingListViewController *listViewController = [[QMMusicRankingListViewController alloc] init];
    listViewController.discoverURL = dic[@"url"];
    [self.navigationController pushViewController:listViewController animated:YES];
    
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
