//
//  NSString+YPExtension.h
//  Sina
//
//  Created by 胡云鹏 on 15/8/23.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YPExtension)

/**
 *  根据传入的文字内容以及字体计算文字的Size
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font;
/**
 *  根据传入的文字内容以及字体计算文字的Size
 *
 *  @param text 文字内容
 *  @param font 文字字体
 *  @param maxW 最大宽度
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;

@end
