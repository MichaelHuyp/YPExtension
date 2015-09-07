//
//  UIImage+YPCapture.m
//  0907-涂鸦
//
//  Created by 胡云鹏 on 15/9/7.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "UIImage+YPCapture.h"

@implementation UIImage (YPCapture)

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2.将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.从当前上下文中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
