//
//  YPLockButton.m
//  0907-手势解锁
//
//  Created by 胡云鹏 on 15/9/7.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "YPLockButton.h"

@implementation YPLockButton

#pragma mark - 初始化 -
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

+ (instancetype)lockButton
{
    return [[self alloc] init];
}

/**
 *  初始化
 */
- (void)setup
{
    // 设置默认的背景图片
    [self setBackgroundImage:[UIImage imageNamed:@"YPLockView.bundle/gesture_node_normal"] forState:UIControlStateNormal];
    // 设置选中时的背景图片(selected)
    [self setBackgroundImage:[UIImage imageNamed:@"YPLockView.bundle/gesture_node_highlighted"] forState:UIControlStateSelected];
}

@end
