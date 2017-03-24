//
//  QMSearchBar.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/24.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "QMSearchHeaderView.h"
#import "QMMusicCenterRequest.h"
@interface QMSearchHeaderView()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;

@end

@implementation QMSearchHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MAIN_TONE_COLOR;
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width-8, 30)];
        self.textField.backgroundColor = SEARCH_BAR_COLOR;
        self.textField.layer.cornerRadius = 3;
        self.textField.tintColor = [UIColor whiteColor];
        self.textField.clipsToBounds = YES;
        self.textField.delegate = self;
        [self addSubview:self.textField];
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [QMMusicCenterRequest searchWithWord:textField.text searchType:@"1" success:^(id responsObject) {
     
    } failure:^(NSError *error) {
        
    }];
    return YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textField.centerX = CGRectGetMaxX(self.bounds)/2;
    self.textField.centerY = CGRectGetMaxY(self.bounds)/2;
}

@end
