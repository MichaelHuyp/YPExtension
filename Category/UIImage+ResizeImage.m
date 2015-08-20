//
//  UIImage+ResizeImage.m
//  YPExtension
//
//  Created by 胡云鹏 on 15/6/1.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIImage+ResizeImage.h"

@implementation UIImage (ResizeImage)

/**
 *  QQ聊天框切图，返回一个可拉伸的图片
 */
+ (UIImage *)resizeWithImageName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    
    // 传入上下左右不需要拉伸的边距，只拉伸中间部分
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
