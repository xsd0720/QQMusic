//
//  QMMusicLibraryViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMusicLibraryViewController.h"
#import "LibMusicBannerCell.h"
#import "LibMusicGridNumCell.h"
#import "LibMusicHotRecommendCell.h"
#import "LibMusicNewExpressCell.h"

#import "QMMusicSingerViewController.h"
#import "QMMusicRankingViewController.h"
#define LIB_BANNER_CELLIDENTIFIER           @"LIB_BANNER_CELLIDENTIFIER"
#define LIB_GRIDNUM_CELLIDENTIFIER          @"LIB_GRIDNUM_CELLIDENTIFIER"
#define LIB_HOTRECOMMEND_CELLIDENTIFIER     @"LIB_HOTRECOMMEND_CELLIDENTIFIER"
#define LIB_NEWEXPRESS_CELLIDENTIFIER       @"LIB_NEWEXPRESS_CELLIDENTIFIER"

@interface QMMusicLibraryViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *libCollectionView;

@property (nonatomic, strong) NSArray *gridsArray;


@end

@implementation QMMusicLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpDataSource];
    
    [self setUpSubView];

}

- (void)setUpDataSource
{
    self.gridsArray = LDS.libraryMusicGridResponse[@"items"];
}


- (void)setUpSubView
{
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    flowLayOut.minimumLineSpacing = 0;
    flowLayOut.minimumInteritemSpacing = 0;
    self.libCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    [self.libCollectionView registerClass:[LibMusicBannerCell class] forCellWithReuseIdentifier:LIB_BANNER_CELLIDENTIFIER];
    [self.libCollectionView registerClass:[LibMusicGridNumCell class] forCellWithReuseIdentifier:LIB_GRIDNUM_CELLIDENTIFIER];
    [self.libCollectionView registerClass:[LibMusicHotRecommendCell class] forCellWithReuseIdentifier:LIB_HOTRECOMMEND_CELLIDENTIFIER];
    [self.libCollectionView registerClass:[LibMusicNewExpressCell class] forCellWithReuseIdentifier:LIB_NEWEXPRESS_CELLIDENTIFIER];
    self.libCollectionView.backgroundColor = [UIColor getColor:@"f8f8f8"];
    self.libCollectionView.delegate = self;
    self.libCollectionView.dataSource = self;
    [self.view addSubview:self.libCollectionView];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return CGSizeMake(CGRectGetMaxX(collectionView.bounds), 80);
        }
            break;
            
        case 1:
        {
            return CGSizeMake(SCREEN_WIDTH/3, 50);
        }
            break;
        case 2:
        {
            return CGSizeMake(SCREEN_WIDTH, 50);
        }
            break;
        default:
            break;
    }
    
    return CGSizeZero;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
            
        case 1:
        {
            return 6;
        }
            break;
        case 2:
        {
            return 2;
        }
            break;
        default:
            break;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            LibMusicBannerCell *bannerCell = [collectionView dequeueReusableCellWithReuseIdentifier:LIB_BANNER_CELLIDENTIFIER forIndexPath:indexPath];
            bannerCell.backgroundColor = [UIColor cyanColor];
            return bannerCell;
        }
            break;
        case 1:
        {
            LibMusicGridNumCell *gridNumCell  = [collectionView dequeueReusableCellWithReuseIdentifier:LIB_GRIDNUM_CELLIDENTIFIER forIndexPath:indexPath];
            gridNumCell.datasource = self.gridsArray[indexPath.row];
            return gridNumCell;
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
    return nil;
}

-  (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                QMMusicSingerViewController *singerViewController = [[QMMusicSingerViewController alloc] init];
                [self.parentViewController.navigationController pushViewController:singerViewController animated:YES];
            }
                break;
            case 1:
            {
                QMMusicRankingViewController *rankingViewController = [[QMMusicRankingViewController alloc] init];
                [self.parentViewController.navigationController pushViewController:rankingViewController animated:YES];
            }
                break;
            case 2:
            {
                
            }
                break;
                
            default:
                break;
        }
    }
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
