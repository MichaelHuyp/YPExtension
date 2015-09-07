//
//  YPLockView.m
//  0907-手势解锁
//
//  Created by 胡云鹏 on 15/9/7.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//


#import "YPLockView.h"
#import "YPLockButton.h"

/** 定义一个不可触摸的点 */
#define YPLockViewUnableTouchPoint (CGPointMake(-10, -10))
#define YPLockViewLineDefaultWidth 8
#define YPLockViewLineDefaultColor [UIColor colorWithRed:32/255.0 green:210/255.0 blue:254/255.0 alpha:0.7]


@interface YPLockView()
/**
 *  存放选中按钮的数组
 */
@property (nonatomic, strong) NSMutableArray *selectedButtons;
/**
 *  当前移动的点
 */
@property (nonatomic, assign) CGPoint currentMovePoint;

@end

@implementation YPLockView

#pragma mark - lazy -
- (NSMutableArray *)selectedButtons
{
    if (_selectedButtons == nil) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}

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

/**
 *  初始化
 */
- (void)setup
{
    // 默认为透明色
    self.backgroundColor = [UIColor clearColor];
    // 默认为三排锁
    self.lockViewType = YPLockViewTypeThree;
    // 默认连线宽度为8
    self.lineWidth = YPLockViewLineDefaultWidth;
    // 默认连线颜色(支付宝原生颜色)
    self.lineColor = YPLockViewLineDefaultColor;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // 摆放锁按钮位置(需要传入锁的类型)
    [self layoutLockButton:self.lockViewType];
}

#pragma mark - 重写set方法
- (void)setLockViewType:(YPLockViewType)lockViewType
{
    _lockViewType = lockViewType;
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 根据锁的类型建立锁按钮
    [self setupLockButton:self.lockViewType];
}


#pragma mark - 绘图 -
- (void)drawRect:(CGRect)rect
{
    if (self.selectedButtons.count == 0) return;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 遍历所有选中的按钮
    for (int index = 0; index < (int)self.selectedButtons.count; index++) {
        YPLockButton *btn = self.selectedButtons[index];
        
        if (index ==0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    
    // 连接
    if (CGPointEqualToPoint(self.currentMovePoint, YPLockViewUnableTouchPoint) == NO) {
        [path addLineToPoint:self.currentMovePoint];
    }
   
    
    // 绘图
    path.lineWidth = self.lineWidth;
    [self.lineColor set];
    // 默认为kCGLineJoinBevel
    path.lineJoinStyle = kCGLineJoinBevel;
    // 默认为kCGLineCapRound
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
}

#pragma mark - 共有方法 -
/******************* 成员方法Start *****************************/
- (instancetype)initWithType:(YPLockViewType)lockViewType
{
    return [self initWithType:lockViewType lineWidth:YPLockViewLineDefaultWidth lineColor:YPLockViewLineDefaultColor];
}
- (instancetype)initWithType:(YPLockViewType)lockViewType lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor
{
    if (self = [super init]) {
        self.lockViewType = lockViewType;
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
    }
    return self;
}
/******************* 成员方法End *****************************/
/******************* 类方法Start *****************************/
+ (instancetype)lockView
{
    return [[self alloc] init];
}
+ (instancetype)lockViewWithType:(YPLockViewType)lockViewType
{
    YPLockView *lockView = [self lockViewWithType:lockViewType lineWidth:YPLockViewLineDefaultWidth lineColor:YPLockViewLineDefaultColor];
    return lockView;
}

+ (instancetype)lockViewWithType:(YPLockViewType)lockViewType lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor
{
    YPLockView *lockView = [[YPLockView alloc] initWithType:lockViewType lineWidth:lineWidth lineColor:lineColor];
    return lockView;
}
/******************* 类方法End *****************************/

#pragma mark - 私有方法 -
/**
 *  根据锁的类型建立锁按钮
 *
 *  @param lockViewType 锁类型
 */
- (void)setupLockButton:(YPLockViewType)lockViewType
{
    int typeCount = 3;
    
    switch (lockViewType) {
        case YPLockViewTypeTwin:
            typeCount = 2;
            break;
        case YPLockViewTypeThree:
            typeCount = 3;
            break;
        case YPLockViewTypeFour:
            typeCount = 4;
            break;
        case YPLockViewTypeFive:
            typeCount = 5;
            break;
        default:
            break;
    }
    
    for (int index = 0; index < pow(typeCount, 2); index++) {
        // 创建按钮
        YPLockButton *lockBtn = [YPLockButton lockButton];
        // 给按钮设置tag
        lockBtn.tag = index;
        // 添加按钮
        [self addSubview:lockBtn];
    }
}

/**
 *  摆放锁按钮位置
 *
 *  @param lockViewType 锁类型
 */
- (void)layoutLockButton:(YPLockViewType)lockViewType
{
    int typeCount = 3;
    
    switch (lockViewType) {
        case YPLockViewTypeTwin:
            typeCount = 2;
            break;
        case YPLockViewTypeThree:
            typeCount = 3;
            break;
        case YPLockViewTypeFour:
            typeCount = 4;
            break;
        case YPLockViewTypeFive:
            typeCount = 5;
            break;
        default:
            break;
    }
    
    for (int index = 0; index < (int)self.subviews.count; index++) {
        // 取出按钮
        YPLockButton *btn = self.subviews[index];
        // 取消按钮的触摸事件
        btn.userInteractionEnabled = NO;
        
        // 设置frame(九宫格算法)
        CGFloat btnW = 74 / typeCount * YPLockViewTypeThree;
        CGFloat btnH = btnW;
        
        // 列数
        int totalColumns = typeCount;
        int col = index % totalColumns;
        int row = index / totalColumns;
        CGFloat marginX = (self.frame.size.width - totalColumns * btnW) / (totalColumns + 1);
        CGFloat marginY = marginX;
        
        CGFloat btnX = marginX + col * (btnW + marginX);
        CGFloat btnY = row * (btnH + marginY);
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 切割下方多余view(根据view的宽度自动算高度)
        if (index == (int)self.subviews.count - 1) {
            CGRect rect = self.frame;
            rect.size.height = CGRectGetMaxY(btn.frame);
            self.frame = rect;
        }
    }
}

/**
 *  根据touches集合获得对应的触摸点位置
 */
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:touch.view];
}
/**
 *  根据触摸点位置获得对应的按钮
 */
- (YPLockButton *)buttonWithPoint:(CGPoint)point
{
    for (YPLockButton *btn in self.subviews) {
        // 圆心恒定为24
        CGFloat wh = 24;
        CGFloat frameX = btn.center.x - wh * 0.5;
        CGFloat frameY = btn.center.y - wh * 0.5;
        if (CGRectContainsPoint(CGRectMake(frameX, frameY, wh, wh), point)) {
            return btn;
        }
    }
    return nil;
}

#pragma mark - 触摸方法 -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 清空当前触摸点
    self.currentMovePoint = YPLockViewUnableTouchPoint;
    
    // 1.获得触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 2.获得触摸的按钮
    YPLockButton *btn = [self buttonWithPoint:pos];
    
    // 3.设置状态
    if (btn && ![self.selectedButtons containsObject:btn]) {
        btn.selected = YES;
        [self.selectedButtons addObject:btn];
    }
    
    // 4.刷新
    [self setNeedsDisplay];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.获得触摸点
    CGPoint pos = [self pointWithTouches:touches];
    
    // 2.获得触摸的按钮
    YPLockButton *btn = [self buttonWithPoint:pos];
    
    // 3.设置状态
    if (btn && ![self.selectedButtons containsObject:btn]) { // 摸到了按钮
        btn.selected = YES;
        [self.selectedButtons addObject:btn];
    } else { // 没有摸到按钮
        self.currentMovePoint = pos;
    }
    
    // 4.刷新
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(lockView:didFinishPath:)]) {
        NSMutableString *path = [NSMutableString string];
        for (YPLockButton *btn in self.selectedButtons) {
            [path appendFormat:@"%d",(int)btn.tag];
        }
        [self.delegate lockView:self didFinishPath:path ];
    }
    
    [self.selectedButtons makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    
    // 清空选中的按钮
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
























