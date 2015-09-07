//
//  YPLockView.h
//  0907-手势解锁
//
//  Created by 胡云鹏 on 15/9/7.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /** 双锁 */
    YPLockViewTypeTwin = 2,
    /** 三锁 */
    YPLockViewTypeThree,
    /** 四锁 */
    YPLockViewTypeFour,
    /** 五锁 */
    YPLockViewTypeFive,
} YPLockViewType;

@class YPLockView;
@protocol YPLockViewDelegate <NSObject>

@optional
- (void)lockView:(YPLockView *)lockView didFinishPath:(NSString *)path;

@end

@interface YPLockView : UIView

#pragma mark - 公有属性 -
/** 代理 */
@property (nonatomic, assign) IBOutlet id<YPLockViewDelegate> delegate;
/** 视图多种锁的类型 */
@property (nonatomic, assign) YPLockViewType lockViewType;
/** 连线宽度 */
@property (nonatomic, assign) CGFloat lineWidth;
/** 连线颜色 */
@property (nonatomic, strong) UIColor *lineColor;

#pragma mark - 共有方法 -
- (instancetype)initWithType:(YPLockViewType)lockViewType;
- (instancetype)initWithType:(YPLockViewType)lockViewType lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;
+ (instancetype)lockView;
+ (instancetype)lockViewWithType:(YPLockViewType)lockViewType;
+ (instancetype)lockViewWithType:(YPLockViewType)lockViewType lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;


@end









