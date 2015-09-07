//
//  MyNavigationBar.m
//  MyNavigationBarDemo
//
//  Created by Visitor on 15/8/2.
//  Copyright (c) 2015年 Visitor. All rights reserved.
//

#import "MyNavigationBar.h"

@implementation MyNavigationBar

- (void)createMyNavigationBarWithBgImageName:(NSString *)bgImageName andTitle:(NSString *)title andTitleView:(UIView *)titleView andLeftItems:(NSArray *)leftItemArray andRightItems:(NSArray *)rightItemArray andClass:(id)classObject andSEL:(SEL)sel
{
    [self createBgImageViewWithBgImageName:bgImageName];
    if(title.length > 0)
        [self createTitleLabelWithTitle:title];
    if(titleView)
        [self createTitileViewWithView:titleView];
    
    CGFloat itemX = 0.0f;
    if(leftItemArray.count > 0)
    {
        for(int i=0;i<leftItemArray.count;i++)
        {
            itemX = [self createItemWithNavigationItem:[leftItemArray objectAtIndex:i] andIsLeft:YES andIndex:i andX:itemX+5.f andClass:classObject andSEL:sel];
        }
    }
    itemX = self.frame.size.width;
    if(rightItemArray.count > 0)
    {
        for(int i=0;i<rightItemArray.count;i++)
        {
            itemX = [self createItemWithNavigationItem:[rightItemArray objectAtIndex:i] andIsLeft:NO andIndex:i andX:itemX-5.f andClass:classObject andSEL:sel];
        }
    }

    
}

// 背景图
- (void)createBgImageViewWithBgImageName:(NSString *)bgImageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:bgImageName]];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
}

// 标题
- (void)createTitleLabelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = self.bounds;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:28];
    label.textColor = [UIColor colorWithRed:0.00f green:0.62f blue:0.91f alpha:1.00f];
    [self addSubview:label];
}

// 标题视图
- (void)createTitileViewWithView:(UIView *)view
{
    view.center = CGPointMake(self.center.x, self.center.y-20);
    [self addSubview:view];
}

// 创建Item
- (CGFloat)createItemWithNavigationItem:(MyNavigationItem *)mni andIsLeft:(BOOL)isLeft andIndex:(int)index andX:(CGFloat)x andClass:(id)classObject andSEL:(SEL)sel
{
    UIImage *bgImge = [UIImage imageNamed:mni.itemBgImageName];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = isLeft?CGRectMake(x, (self.bounds.size.height-bgImge.size.height)/2, bgImge.size.width, bgImge.size.height):CGRectMake(x-bgImge.size.width, (self.bounds.size.height-bgImge.size.height)/2, bgImge.size.width, bgImge.size.height);
    [btn setTitle:mni.itemTitle forState:UIControlStateNormal];
    [btn setBackgroundImage:bgImge forState:UIControlStateNormal];
    [btn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.tag = isLeft?index:index+1000;
    [self addSubview:btn];
    return isLeft?x+bgImge.size.width:x-bgImge.size.width;
    
}














/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
