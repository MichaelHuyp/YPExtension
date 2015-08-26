//
//  NSDate+YPExtension.h
//  Sina
//
//  Created by 胡云鹏 on 15/8/25.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YPExtension)
/**
 *  判断传入日期是否为今年
 */
+ (BOOL)isThisYear:(NSDate *)date;
/**
 *  判断传入日期是否为昨天
 */
+ (BOOL)isYesterday:(NSDate *)date;
/**
 *  判断传入日期是否为今天
 */
+ (BOOL)isToday:(NSDate *)date;

/**
 *  判断日期是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断日期是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断日期是否为今天
 */
- (BOOL)isToday;

@end
