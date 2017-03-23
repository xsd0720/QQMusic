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
#import "QMMusicCenterRequest.h"
#define CELLIDENFTIFER @"CELLIDENFTIFER"

@interface QMMusicSingerViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *singerTableView;

@property (nonatomic, strong) NSMutableArray *artistsArray;

@end

@implementation QMMusicSingerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpSubView];
    
    [self requestDataSource];
}

- (void)setUpSubView
{
    self.singerTableView = [[UITableView alloc] initWithFrame:HASNAV_RECT style:UITableViewStylePlain];
    self.singerTableView.dataSource = self;
    self.singerTableView.delegate = self;
    [self.singerTableView registerClass:[SingerCell class] forCellReuseIdentifier:CELLIDENFTIFER];
    [self.view addSubview:self.singerTableView];
}


- (void)requestDataSource
{
    [QMMusicCenterRequest getArtistListWithoffset:0 total:false limit:100 success:^(id responsObject) {
        if ([responsObject objectForKey:@"artists"]) {
            self.artistsArray = [[NSMutableArray alloc] initWithArray:[responsObject objectForKey:@"artists"]];
            [self.singerTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artistsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingerCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENFTIFER forIndexPath:indexPath];
    cell.textLabel.text = self.artistsArray[indexPath.row][@"name"];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.artistsArray[indexPath.row][@"picUrl"]] placeholderImage:nil];
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
