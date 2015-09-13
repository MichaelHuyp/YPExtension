//
// Created by Fabrice Aneche on 06/01/14.
// Copyright (c) 2014 Dailymotion. All rights reserved.
//

#import "NSData+ImageContentType.h"


@implementation NSData (ImageContentType)
/**
 *  根据传入的数据获取图片的类型
 */
+ (NSString *)sd_contentTypeForImageData:(NSData *)data {
    /**
     *  typedef unsigned char uint8_t;
     *  搞一个无符号的字符
     */
    uint8_t c;
    // 取出data中1字节长度存入c这个提前声明的字符中,说白了就是检查数据的第一个字符就足以分辨图片格式
    [data getBytes:&c length:1];
    switch (c) { // 如果数据存在
        /**
         *  image/jpeg格式的数据以0xFF开头
         *  image/png格式的数据以0x89开头
         *  image/gif格式的数据以0x47开头
         *  image/tiff格式的数据以0x4D开头
         *  因此下面这个算法是根据数据分析出图片的格式
         */
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
        case 0x52:
            // R as RIFF for WEBP
            if ([data length] < 12) { // 如果数据长度小于12直接返回空
                return nil;
            }
            // 如果数据长度大于等于12 根据数据截取0 - 12范围的数据以ASCLL码的形式转换成字符串
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                // 如果这个字符串以RIFF开头并且以WEBP结尾,图片格式就为image/webp
                return @"image/webp";
            }
            // 否则返回空
            return nil;
    }
    // 数据不存在返回空
    return nil;
}

@end


@implementation NSData (ImageContentTypeDeprecated)

+ (NSString *)contentTypeForImageData:(NSData *)data {
    return [self sd_contentTypeForImageData:data];
}

@end
