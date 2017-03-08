//
//  QMLeftMenuViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//









#import "QMLeftMenuViewController.h"



#pragma mark -----
#pragma mark -----    QMLeftMenuViewControllerHeaderViewItem Class ----------------
@interface QMLeftMenuViewControllerHeaderViewItem : UIControl

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation QMLeftMenuViewControllerHeaderViewItem


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_iconImageView];
        
    
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = RGB(35, 35, 35);
        [self addSubview:_titleLabel];
        
        
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = RGB(140, 140, 140);
        [self addSubview:_detailLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _iconImageView.frame = CGRectMake(0, 0, 45, 45);
    _iconImageView.centerX = CGRectGetMaxX(self.bounds)/2;
    _iconImageView.centerY = CGRectGetMaxY(self.bounds)/2-25;
    
    
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_iconImageView.frame)+10, CGRectGetMaxX(self.bounds), 20);
    
    _detailLabel.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), CGRectGetMaxX(self.bounds), 15);
    
}

@end


#pragma mark -----
#pragma mark -----    QMLeftMenuViewControllerHeaderView Class ----------------
@interface QMLeftMenuViewControllerHeaderView : UIView

@end

@implementation QMLeftMenuViewControllerHeaderView

- (instancetype)initWithFrame:(CGRect)frame imageNames:(NSArray<NSString *> *)imageNames titles:(NSArray<NSString *> *)titles subTitles:(NSArray<NSString *> *)subTitles;
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width/3;
        [imageNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            QMLeftMenuViewControllerHeaderViewItem *item = [[QMLeftMenuViewControllerHeaderViewItem alloc] initWithFrame:CGRectMake(width*idx, 0, width, frame.size.height)];
            item.iconImageView.image = [UIImage imageNamed:obj];
            item.titleLabel.text = titles[idx];
            item.detailLabel.text = subTitles[idx];
            [self addSubview:item];
        }];
    }
    return self;
}

@end


#pragma mark -----
#pragma mark -----    QMLeftMenuViewController Class ----------------
#define CELLIDENTIFIER      @"CELLIDENTIFIER"
#define FOOTERVIEWHEIGHT        55
@interface QMLeftMenuViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) QMLeftMenuViewControllerHeaderView *headerView;

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation QMLeftMenuViewController


- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame)+1.5, MENUMAXSHOWWIDTH, SCREEN_HEIGHT-SYS_STATUSBAR_HEIGHT-self.headerView.height-FOOTERVIEWHEIGHT)];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.showsHorizontalScrollIndicator = NO;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
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
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setUpSubView
{
    self.headerView = [[QMLeftMenuViewControllerHeaderView alloc] initWithFrame:CGRectMake(0, SYS_STATUSBAR_HEIGHT, MENUMAXSHOWWIDTH, 150) imageNames:@[@"more_icon_vip_normal", @"more_icon_personal_center", @"more_icon_notificationcenter"] titles:@[@"升级为VIP", @"个性化中心", @"消息中心"] subTitles:@[@"畅想音乐特权", @"默认主题", @""]];
    [self.view addSubview:self.headerView];
    
    
    UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.headerView.frame), MENUMAXSHOWWIDTH-20, 1.5)];
    topLineView.backgroundColor = RGB(237, 237, 237);
    [self.view addSubview:topLineView];
    
    
    self.datasource = @[@"仅Wi-Fi联网", @"简洁模式", @"定时关闭", @"免流量服务", @"传歌到手机", @"QPlay与车载音乐", @"清理占用空间", @"关于QQ音乐"];
    [self.view addSubview:self.listTableView];
    
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.listTableView.frame), MENUMAXSHOWWIDTH-20, 1.5)];
    bottomLineView.backgroundColor = RGB(237, 237, 237);
    [self.view addSubview:bottomLineView];
    

    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingButton setImage:[UIImage imageNamed:@"more_icon_bottom_setting"] forState:UIControlStateNormal];
     [settingButton setImage:[UIImage imageNamed:@"more_icon_bottom_setting"] forState:UIControlStateHighlighted];
    settingButton.frame = CGRectMake(10, CGRectGetMaxY(bottomLineView.frame), 80, FOOTERVIEWHEIGHT);
    [settingButton setTitle:@" 设置" forState:UIControlStateNormal];
    [settingButton setTitleColor:RGB(35, 35, 35) forState:UIControlStateNormal];
    settingButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:settingButton];
    
    
    UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitButton setImage:[UIImage imageNamed:@"more_icon_bottom_logout"] forState:UIControlStateNormal];
    [exitButton setImage:[UIImage imageNamed:@"more_icon_bottom_logout"] forState:UIControlStateHighlighted];
    [exitButton setTitle:@" 退出微信登陆" forState:UIControlStateNormal];
    exitButton.frame = CGRectMake(MENUMAXSHOWWIDTH-125-10, CGRectGetMaxY(bottomLineView.frame), 125, FOOTERVIEWHEIGHT);
    exitButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [exitButton setTitleColor:RGB(35, 35, 35) forState:UIControlStateNormal];
    [self.view addSubview:exitButton];
    
}


#pragma mark -----
#pragma mark -----     ListTableView Delegates ---------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER forIndexPath:indexPath];
    cell.textLabel.text = self.datasource[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = RGB(35, 35, 35);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
