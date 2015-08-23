//
//  MyNavigationBar.h
//  MyNavigationBarDemo
//
//  Created by Visitor on 15/8/2.
//  Copyright (c) 2015年 Visitor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationItem.h"

@interface MyNavigationBar : UIView
- (void)createMyNavigationBarWithBgImageName:(NSString *)bgImageName andTitle:(NSString *)title andTitleView:(UIView *)titleView andLeftItems:(NSArray *)leftItemArray andRightItems:(NSArray *)rightItemArray andClass:(id)classObject andSEL:(SEL)sel;
@end










