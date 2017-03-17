//
//  QMMineViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMMineViewController.h"
#import "MyMusicUserInfoCollectionCell.h"
#import "MyMusicGridNumCell.h"
#import "MyMusicGuessiLikeCollectionCell.h"
#import "MyMusicTitleCell.h"

#define MINE_USERINFO_COLLECTOIN_CELLIDENTIFIER  @"MINE_USERINFO_COLLECTOIN_CELLIDENTIFIER"
#define MINE_GRIDNUM_COLLECTOIN_CELLIDENTIFIER  @"MINE_GRIDNUM_COLLECTOIN_CELLIDENTIFIER"
#define MINE_GUESS_COLLECTOIN_CELLIDENTIFIER  @"MINE_GUESS_COLLECTOIN_CELLIDENTIFIER"
#define MINE_TITLE_COLLECTOIN_CELLIDENTIFIER  @"MINE_TITLE_COLLECTOIN_CELLIDENTIFIER"

@interface QMMineViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *mineCollectionView;

@property (nonatomic, strong) NSArray *gridsArray;

@end

@implementation QMMineViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpDataSource];
    
    [self setUpSubView];
}

- (void)setUpDataSource
{
    self.gridsArray = LDS.myMusicGridResponse[@"items"];
}

- (void)setUpSubView
{
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    flowLayOut.minimumLineSpacing = 0;
    flowLayOut.minimumInteritemSpacing = 0;
    self.mineCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    [self.mineCollectionView registerClass:[MyMusicUserInfoCollectionCell class] forCellWithReuseIdentifier:MINE_USERINFO_COLLECTOIN_CELLIDENTIFIER];
    [self.mineCollectionView registerClass:[MyMusicGridNumCell class] forCellWithReuseIdentifier:MINE_GRIDNUM_COLLECTOIN_CELLIDENTIFIER];
    [self.mineCollectionView registerClass:[MyMusicGuessiLikeCollectionCell class] forCellWithReuseIdentifier:MINE_GUESS_COLLECTOIN_CELLIDENTIFIER];
    [self.mineCollectionView registerClass:[MyMusicTitleCell class] forCellWithReuseIdentifier:MINE_TITLE_COLLECTOIN_CELLIDENTIFIER];
    self.mineCollectionView.backgroundColor = [UIColor getColor:@"f8f8f8"];
    self.mineCollectionView.delegate = self;
    self.mineCollectionView.dataSource = self;
    [self.view addSubview:self.mineCollectionView];

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
            return CGSizeMake(CGRectGetMaxX(collectionView.bounds), 120);
        }
            break;
            
        case 1:
        {
            return CGSizeMake(SCREEN_WIDTH/3, 100);
        }
            break;
        case 2:
        {
         
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
            return self.gridsArray.count;
        }
            break;
        case 2:
        {
            return 1;
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
            MyMusicUserInfoCollectionCell *musicUserInfoCell = [collectionView dequeueReusableCellWithReuseIdentifier:MINE_USERINFO_COLLECTOIN_CELLIDENTIFIER forIndexPath:indexPath];
            return musicUserInfoCell;
        }
            break;
            
        case 1:
        {
            MyMusicGridNumCell *girdCell = [collectionView dequeueReusableCellWithReuseIdentifier:MINE_GRIDNUM_COLLECTOIN_CELLIDENTIFIER forIndexPath:indexPath];
            girdCell.datasource = self.gridsArray[indexPath.row];
            return girdCell;
        }
            break;
        case 2:
        {
          
        }
            break;
        default:
            break;
    }
    return nil;
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
