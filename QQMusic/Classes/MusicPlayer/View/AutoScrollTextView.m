//
//  AutoScrollTextView.m
//  QQMusic
//
//  Created by xwmedia01 on 2017/3/13.
//  Copyright © 2017年 xwmedia01. All rights reserved.
//

#import "AutoScrollTextView.h"

@implementation AutoScrollTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       [self config];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config
{
//    self.userInteractionEnabled = NO;
    self.textContainer.lineFragmentPadding = 0;
    self.bounces = NO;
    self.selectable = NO;
    self.editable = NO;
    self.layoutManager.allowsNonContiguousLayout = NO;
    self.backgroundColor = [UIColor clearColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.textContainer.maximumNumberOfLines = 1;

}

- (void)setText:(NSString *)text
{
    [super setText:text];

    //Vertical center
//    self.contentInset = UIEdgeInsetsMake((self.bounds.size.height-self.contentSize.height)/2, 0, 0, 0);
    
    
    CGSize constraintSize = CGSizeMake(MAXFLOAT, self.bounds.size.height);
    CGSize thatFitSize = [self sizeThatFits:constraintSize];
    CGFloat textWidth =  thatFitSize.width;
    self.contentSize = CGSizeMake(ceil(textWidth), self.contentSize.height);
    if (textWidth > self.bounds.size.width) {
        [self animationToEnd];
    }
    else
    {
        NSLog(@"正好");
    }
}

- (void)animationToEnd
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat maxMove = self.contentSize.width-self.bounds.size.width;

        if (maxMove > 0) {
            [UIView animateWithDuration:5 animations:^{
                [self setContentOffset:CGPointMake(maxMove, 0)];
            } completion:^(BOOL finished) {
                
            }];
        }
    });
  
}


- (void)animationToBegin
{
    
}

@end
