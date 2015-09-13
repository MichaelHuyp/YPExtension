/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIView+WebCacheOperation.h"
#import "objc/runtime.h"

static char loadOperationKey;

@implementation UIView (WebCacheOperation)

- (NSMutableDictionary *)operationDictionary {
    // 从loadOperationKey关联中取出操作字典
    NSMutableDictionary *operations = objc_getAssociatedObject(self, &loadOperationKey);
    if (operations) { // 如果这个字典存在直接返回这个字典
        return operations;
    }
    // 如果字典不存在创建一个可变字典
    operations = [NSMutableDictionary dictionary];
    // 将这个可变字典以loadOperationKey关键字关联到UIView
    objc_setAssociatedObject(self, &loadOperationKey, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return operations;
}

- (void)sd_setImageLoadOperation:(id)operation forKey:(NSString *)key {
    // 存储操作时,先看看这个key有没有对应的操作,如果有取消这个操作并将其对应的key移除字典
    [self sd_cancelImageLoadOperationWithKey:key];
    // 获取关联的操作字典
    NSMutableDictionary *operationDictionary = [self operationDictionary];
    // 将这个操作和对应的key添加到关联的操作字典中
    [operationDictionary setObject:operation forKey:key];
}

- (void)sd_cancelImageLoadOperationWithKey:(NSString *)key {
    // Cancel in progress downloader from queue
    // 从UIView关联中取出操作字典
    NSMutableDictionary *operationDictionary = [self operationDictionary];
    // 根据传入的key取出操作字典中的操作
    id operations = [operationDictionary objectForKey:key];
    if (operations) { // 如果操作存在
        if ([operations isKindOfClass:[NSArray class]]) { // 如果这个操作是个数组或数组的子类
            for (id <SDWebImageOperation> operation in operations) { // 遍历这个数组
                if (operation) { // 如果数组不为空
                    // 将操作取消掉
#warning 还没找到cancel是如何实现的。。。。
                    [operation cancel];
                }
            }
            // conformsToProtocol:@protocol()是用来检查对象是否实现了指定协议
        } else if ([operations conformsToProtocol:@protocol(SDWebImageOperation)]){ // 如果这个操作不是个数组并且遵守了SDWebImageOperation协议
            // 同样将操作取消掉
            [(id<SDWebImageOperation>) operations cancel];
        }
        // 最后将这个key移除操作字典
        [operationDictionary removeObjectForKey:key];
    }
}

- (void)sd_removeImageLoadOperationWithKey:(NSString *)key {
    NSMutableDictionary *operationDictionary = [self operationDictionary];
    [operationDictionary removeObjectForKey:key];
}

@end
