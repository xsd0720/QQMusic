//
//  QMMusicRankingListViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/21.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMusicRankingListViewController.h"
#import "QMMusicCenterRequest.h"
#import "QMAudioPlayerViewController.h"
#define SONGLIST_CELLIDENTIFIER     @"SONGLIST_CELLIDENTIFIER"

@interface QMMusicRankingListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *songlistTableView;

@property (nonatomic, strong) NSArray *dataSourceSongids;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation QMMusicRankingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpSubView];
    
    [QMMusicCenterRequest getTopSongListWithURL:self.discoverURL success:^(id responsObject) {
        
        self.dataSourceSongids = [self matchString:responsObject toRegexString:@"/m/song/(\\d+)"];
//        NSSet *set = [NSSet setWithArray:self.dataSourceSongids];
//        self.dataSourceSongids = [set allObjects];
        [QMMusicCenterRequest getSongDetailWithIds:self.dataSourceSongids success:^(id responsObject) {
            self.dataSource = responsObject[@"songs"];
            [self.songlistTableView reloadData];
        } failure:^(NSError *error) {
            
        }];
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)setUpSubView
{
    
    self.songlistTableView = [[UITableView alloc] initWithFrame:HASNAV_RECT style:UITableViewStylePlain];
    self.songlistTableView.dataSource = self;
    self.songlistTableView.delegate = self;
    self.songlistTableView.tableFooterView = [UIView new];
    [self.songlistTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SONGLIST_CELLIDENTIFIER];
    [self.view addSubview:self.songlistTableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SONGLIST_CELLIDENTIFIER forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%li-%@", indexPath.row+1, self.dataSource[indexPath.row][@"name"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.dataSource[indexPath.row];

    dispatch_async(dispatch_get_main_queue(), ^{
        QMAudioPlayerViewController *audioPlayerViewController = [[QMAudioPlayerViewController alloc] init];
        audioPlayerViewController.songName = dic[@"name"];
        audioPlayerViewController.picURLStr = dic[@"album"][@"picUrl"];
        audioPlayerViewController.songURLStr = dic[@"mp3Url"];
        [self presentViewController:audioPlayerViewController animated:YES completion:nil];
    });

}


- (NSArray *)matchString:(NSString *)string toRegexString:(NSString *)regexStr
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in matches) {
        //以正则中的(),划分成不同的匹配部分
        NSString *component = [string substringWithRange:[match rangeAtIndex:(match.numberOfRanges-1)]];
        
        [array addObject:component];
    }
    
    return array;
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
