//
//  QMContainersViewController.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/3.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMContainersViewController.h"

#import "QMMineViewController.h"
#import "QMMusicLibraryViewController.h"

#define SEGMENTFONT     18

@interface ContainerScollView : UIScrollView

@end

@implementation ContainerScollView


@end


@interface QMContainersSegment : UIControl

@property (nonatomic, assign) int selectedIndex;

@end


@implementation QMContainersSegment

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _selectedIndex = -1;
        
        [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *segmentItem = [UIButton buttonWithType:UIButtonTypeCustom];
            [segmentItem setTitle:obj forState:UIControlStateNormal];
            segmentItem.titleLabel.font = [UIFont systemFontOfSize:SEGMENTFONT];
            segmentItem.frame = CGRectMake(frame.size.width/2*idx, 0, frame.size.width/2, frame.size.height);
            [self addSubview:segmentItem];
        }];
    }
    return self;
    
}

- (void)setSelectedIndex:(int)selectedIndex
{
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        
        [self.subviews enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (selectedIndex == idx) {
                obj.titleLabel.font = [UIFont boldSystemFontOfSize:SEGMENTFONT];
            }else
            {
                 obj.titleLabel.font = [UIFont systemFontOfSize:SEGMENTFONT];
            }
        }];
        
    }
}
@end

@interface QMContainersViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *navView;

@property (nonatomic, strong) ContainerScollView *mainScrollView;

@property (nonatomic, strong) QMMineViewController *mineViewController;
@property (nonatomic, strong) QMMusicLibraryViewController *musicLibraryController;

@property (nonatomic) UIButton *navLeftButton;

@property (nonatomic) UIButton *navRightButton;

@property (nonatomic) QMContainersSegment *containerSegment;

@end

@implementation QMContainersViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpNav];
    [self setUpSubView];
    
}

- (void)setUpNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_AND_NAV_BAR_HEIGHT)];
    self.navView.backgroundColor = MAIN_TONE_COLOR;
    [self.view addSubview:self.navView];
    
    CGFloat marginLeftRight = 5;
    
    self.navLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navLeftButton setImage:[UIImage imageNamed:@"concise_icon_more_normal"] forState:UIControlStateNormal];
    [self.navLeftButton setImage:[UIImage imageNamed:@"concise_icon_more_highlight"] forState:UIControlStateHighlighted];
    self.navLeftButton.frame = CGRectMake(marginLeftRight, SYS_STATUSBAR_HEIGHT, NAVIGATIONBAR_HEIGHT, NAVIGATIONBAR_HEIGHT);
    [self.navLeftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.navLeftButton];
    
    
    self.navRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navRightButton setImage:[UIImage imageNamed:@"concise_icon_musichall_normal"] forState:UIControlStateNormal];
    [self.navRightButton setImage:[UIImage imageNamed:@"concise_icon_musichall_highlight"] forState:UIControlStateHighlighted];
    self.navRightButton.frame = CGRectMake(SCREEN_WIDTH-marginLeftRight-NAVIGATIONBAR_HEIGHT, SYS_STATUSBAR_HEIGHT, NAVIGATIONBAR_HEIGHT, NAVIGATIONBAR_HEIGHT);
    [self.navRightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.navRightButton];
    
    
    self.containerSegment = [[QMContainersSegment alloc] initWithFrame:CGRectMake(0, SYS_STATUSBAR_HEIGHT, 120, NAVIGATIONBAR_HEIGHT) titles:@[@"我的", @"音乐馆"]];
    self.containerSegment.centerX = self.navView.width/2;
    [self.navView addSubview:self.containerSegment];
    
}

- (void)setUpSubView
{
    self.mainScrollView = [[ContainerScollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navView.frame), CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds)-CGRectGetMaxY(self.navView.frame))];
    self.mainScrollView.contentSize = CGSizeMake(CGRectGetMaxX(self.view.bounds)*2, 0);
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.delegate = self;
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.mainScrollView];
    
    
    self.mineViewController = [[QMMineViewController alloc] init];
    [self addChildViewController:self.mineViewController];
    self.mineViewController.view.frame = self.mainScrollView.bounds;
    [self.mainScrollView addSubview:self.mineViewController.view];

    
    
    self.musicLibraryController = [[QMMusicLibraryViewController alloc] init];
    [self addChildViewController:self.musicLibraryController];
    self.musicLibraryController.view.frame = self.mainScrollView.bounds;
    self.musicLibraryController.view.x = CGRectGetMaxX(self.view.bounds);
    [self.mainScrollView addSubview:self.musicLibraryController.view];
    
    [self scrollViewDidScroll:self.mainScrollView];
    [self scrollViewDidEndDecelerating:self.mainScrollView];
}


//用 bounces 属性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.bounces = (scrollView.contentOffset.x <= 0) ? NO : YES;  
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        [self scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width;
    [self.containerSegment setSelectedIndex:index];
}


- (BOOL)scrollOffsetXIsZero
{
    return self.mainScrollView.contentOffset.x == 0;
}


- (void)leftButtonAction
{
    if (self.containersDelegate && [self.containersDelegate respondsToSelector:@selector(containersNavLeftButtonAction)]) {
        [self.containersDelegate containersNavLeftButtonAction];
    }
}

- (void)rightButtonAction
{
    if (self.containersDelegate && [self.containersDelegate respondsToSelector:@selector(containersNavRightButtonAction)]) {
        [self.containersDelegate containersNavRightButtonAction];
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
