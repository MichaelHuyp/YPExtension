/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"

static char imageURLKey;
static char TAG_ACTIVITY_INDICATOR;
static char TAG_ACTIVITY_STYLE;
static char TAG_ACTIVITY_SHOW;

@implementation UIImageView (WebCache)
/**
 *  给imageView以url的形式添加一张图片
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url 图片的url
 */
- (void)sd_setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}
/**
 *  给imageView以url的形式添加一张图片、以及占位图片
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url         图片的url
 *  @param placeholder 图片初始化时占位用的、直到图片请求完成为止
 *  具体详情请参照 sd_setImageWithURL:placeholderImage:options:这个方法
 */
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}
/**
 *  给imageView以url的形式添加一张图片、以及占位图片和自定义选项
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url         图片的url
 *  @param placeholder 图片初始化时占位用的、直到图片请求完成为止
 *  @param options     当正在下载图片时的使用选项、具体可用的值详情请参照 SDWebImageOptions
 */
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}
/**
 *  给imageView以url的形式添加一张图片、完成时回调的block
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url            图片的url
 *
 *  @param completedBlock
 *
 *  typedef void(^SDWebImageCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);
 *
 *  1.当操作完成时,这个block会被调用。
 *  2.这个block没有返回值。
 *  3.并且采取UIImage作为第一个参数。
 *  4.在错误的情况下这个UIImage对象为空并且第二个参数会包含一个NSError错误对象。
 *  5.第三个参数是一个枚举值 SDImageCacheType(SDImageCacheTypeNone(该图像是没有使用SDWebImage缓存机制，是从网站被下载的),SDImageCacheTypeDisk(该图片是从沙盒缓存中读取的),SDImageCacheTypeMemory(该图片是从内存中读取的)) 说明其来源
 *  6.第四个参数为该图片的源url路径
 */
- (void)sd_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}
/**
 *  给imageView以url的形式添加一张图片、以及占位图片、完成时回调的block
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url            图片的url
 *  @param placeholder    图片初始化时占位用的、直到图片请求完成为止
 *  @param completedBlock
 *
 *  typedef void(^SDWebImageCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);
 *
 *  1.当操作完成时,这个block会被调用。
 *  2.这个block没有返回值。
 *  3.并且采取UIImage作为第一个参数。
 *  4.在错误的情况下这个UIImage对象为空并且第二个参数会包含一个NSError错误对象。
 *  5.第三个参数是一个枚举值 SDImageCacheType(SDImageCacheTypeNone(该图像是没有使用SDWebImage缓存机制，是从网站被下载的),SDImageCacheTypeDisk(该图片是从沙盒缓存中读取的),SDImageCacheTypeMemory(该图片是从内存中读取的)) 说明其来源
 *  6.第四个参数为该图片的源url路径
 */
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}
/**
 *  给imageView以url的形式添加一张图片、以及占位图片和自定义选项、完成时回调的block
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url            图片的url
 *  @param placeholder    图片初始化时占位用的、直到图片请求完成为止
 *  @param completedBlock
 *
 *  typedef void(^SDWebImageCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);
 *
 *  1.当操作完成时,这个block会被调用。
 *  2.这个block没有返回值。
 *  3.并且采取UIImage作为第一个参数。
 *  4.在错误的情况下这个UIImage对象为空并且第二个参数会包含一个NSError错误对象。
 *  5.第三个参数是一个枚举值 SDImageCacheType(SDImageCacheTypeNone(该图像是没有使用SDWebImage缓存机制，是从网站被下载的),SDImageCacheTypeDisk(该图片是从沙盒缓存中读取的),SDImageCacheTypeMemory(该图片是从内存中读取的)) 说明其来源
 *  6.第四个参数为该图片的源url路径
 *
 *  @param options     当正在下载图片时的使用选项、具体可用的值详情请参照 SDWebImageOptions
 */
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}
/**
 *  给imageView以url的形式添加一张图片、以及占位图片和自定义选项、完成时回调的block、以及下载的进度显示
 *
 *  下载是异步执行的并且带有缓存
 *
 *  @param url            图片的url
 *  @param placeholder    图片初始化时占位用的、直到图片请求完成为止
 *  @param completedBlock
 *
 *  typedef void(^SDWebImageCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);
 *
 *  1.当操作完成时,这个block会被调用。
 *  2.这个block没有返回值。
 *  3.并且采取UIImage作为第一个参数。
 *  4.在错误的情况下这个UIImage对象为空并且第二个参数会包含一个NSError错误对象。
 *  5.第三个参数是一个枚举值 SDImageCacheType(SDImageCacheTypeNone(该图像是没有使用SDWebImage缓存机制，是从网站被下载的),SDImageCacheTypeDisk(该图片是从沙盒缓存中读取的),SDImageCacheTypeMemory(该图片是从内存中读取的)) 说明其来源
 *  6.第四个参数为该图片的源url路径
 *
 *  @param options     当正在下载图片时的使用选项、具体可用的值详情请参照 SDWebImageOptions
 *
 *  SDWebImageOptions
 *
 *  
 *  @param progressBlock  当图片正在下载时触发的block
 *
 *  SDWebImageDownloaderProgressBlock
 *
 *  typedef void(^SDWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
 *
 *  receivedSize:接收数据的大小,expectedSize:期望数据的大小
 */
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock {
    
#warning TODO
    // 取消当前的图片加载
    [self sd_cancelCurrentImageLoad];
    
#warning TODO
    // 运行时关联方法(源对象，关键字，关联的对象和一个关联策略)
    // 把使用者传入的url以关联的形式保存起来,以&imageURLKey关键字存储
    objc_setAssociatedObject(self, &imageURLKey, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    /**
     *  options(1 << 0 --- 1 << 6) & SDWebImageDelayPlaceholder(1 << 9)
     *  所以这个结果为永真
     */
#warning 作者为什么要这么写?直接写永真不好？这样写有哪些好处?我目前推测这个功能还没有添加进去
    if (!(options & SDWebImageDelayPlaceholder)) {
        /**
         *  block内的代码 先判断当前是否为主线程,如果是主线程马上调用,如果不是主线程回到主线程调用
         *  说白了就是保证self.image = placeholder;这段代码一直在主线程中调用
         *  #define dispatch_main_async_safe(block)\
         *   if ([NSThread isMainThread]) {\
         *   block();\
         *   } else {\
         *   dispatch_async(dispatch_get_main_queue(), block);\
         }
         */
        dispatch_main_async_safe(^{
            // 先弄一个占位图片
            self.image = placeholder;
        });
    }
    
    if (url) { // 如果url有值

        // 检查一下activityView是否可以使用
        // check if activityView is enabled or not
        if ([self showActivityIndicatorView]) { // 是否需要展示activityView指示器
            // 如果showActivityIndicatorView返回值为YES,则添加动态指示器
            [self addActivityIndicator];
        }

        // 取消强循环引用
        __weak __typeof(self)wself = self;
        // SDWebImageOperation 只有一个 - (void)cancel 协议方法
        id <SDWebImageOperation> operation = [SDWebImageManager.sharedManager downloadImageWithURL:url options:options progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) { // 这是图片下载完成后回调的block
            // 首先将菊花移除
            [wself removeActivityIndicator];
            // 如果当前UIimageView对象为空直接返回
            if (!wself) return;
            dispatch_main_sync_safe(^{ // 强行回到主线程
                // 如果当前UIimageView对象为空直接返回
                if (!wself) return;
                // options & SDWebImageAvoidAutoSetImage 的返回值为0
                // 因此这个判断永远为假 我推测这个功能还没有添加
                if (image && (options & SDWebImageAvoidAutoSetImage) && completedBlock)
                {
                    completedBlock(image, error, cacheType, url);
                    return;
                }
                else if (image) { // 如果图片不为空
                    // 设置图片
                    wself.image = image;
                    // 这个方法是异步执行的,setNeedsLayout会默认调用layoutSubViews
                    [wself setNeedsLayout];
                } else { // 如果图片为空
                    if ((options & SDWebImageDelayPlaceholder)) { // 永假
                        wself.image = placeholder;
                        [wself setNeedsLayout];
                    }
                }
                // 回调block
                if (completedBlock && finished) {
                    // 传入图片,错误信息,当前缓存机制,当前url
                    completedBlock(image, error, cacheType, url);
                }
            });
        }];
        // 将刚刚取得的operation以UIImageViewImageLoad关键字添加到操作字典中
        [self sd_setImageLoadOperation:operation forKey:@"UIImageViewImageLoad"];
    } else { // 如果url为空
        dispatch_main_async_safe(^{ // 强行回到主线程
            // 首先移除菊花
            [self removeActivityIndicator];
            // 搞一个错误信息
            NSError *error = [NSError errorWithDomain:SDWebImageErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Trying to load a nil url"}];
            // 将错误信息传入completedBlock进行回调
            if (completedBlock) {
                // 图片为空,错误信息,该图像是没有使用SDWebImage缓存机制，是从网站被下载的,当前url(空)
                completedBlock(nil, error, SDImageCacheTypeNone, url);
            }
        });
    }
}

- (void)sd_setImageWithPreviousCachedImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock {
    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
    UIImage *lastPreviousCachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
    
    [self sd_setImageWithURL:url placeholderImage:lastPreviousCachedImage ?: placeholder options:options progress:progressBlock completed:completedBlock];    
}

- (NSURL *)sd_imageURL {
    return objc_getAssociatedObject(self, &imageURLKey);
}

- (void)sd_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs {
    [self sd_cancelCurrentAnimationImagesLoad];
    __weak __typeof(self)wself = self;

    NSMutableArray *operationsArray = [[NSMutableArray alloc] init];

    for (NSURL *logoImageURL in arrayOfURLs) {
        id <SDWebImageOperation> operation = [SDWebImageManager.sharedManager downloadImageWithURL:logoImageURL options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if (!wself) return;
            dispatch_main_sync_safe(^{
                __strong UIImageView *sself = wself;
                [sself stopAnimating];
                if (sself && image) {
                    NSMutableArray *currentImages = [[sself animationImages] mutableCopy];
                    if (!currentImages) {
                        currentImages = [[NSMutableArray alloc] init];
                    }
                    [currentImages addObject:image];

                    sself.animationImages = currentImages;
                    [sself setNeedsLayout];
                }
                [sself startAnimating];
            });
        }];
        [operationsArray addObject:operation];
    }

    [self sd_setImageLoadOperation:[NSArray arrayWithArray:operationsArray] forKey:@"UIImageViewAnimationImages"];
}

- (void)sd_cancelCurrentImageLoad {
    [self sd_cancelImageLoadOperationWithKey:@"UIImageViewImageLoad"];
}

- (void)sd_cancelCurrentAnimationImagesLoad {
    [self sd_cancelImageLoadOperationWithKey:@"UIImageViewAnimationImages"];
}


#pragma mark -
- (UIActivityIndicatorView *)activityIndicator {
    return (UIActivityIndicatorView *)objc_getAssociatedObject(self, &TAG_ACTIVITY_INDICATOR);
}

- (void)setActivityIndicator:(UIActivityIndicatorView *)activityIndicator {
    objc_setAssociatedObject(self, &TAG_ACTIVITY_INDICATOR, activityIndicator, OBJC_ASSOCIATION_RETAIN);
}

- (void)setShowActivityIndicatorView:(BOOL)show{
    objc_setAssociatedObject(self, &TAG_ACTIVITY_SHOW, [NSNumber numberWithBool:show], OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)showActivityIndicatorView{
    return [objc_getAssociatedObject(self, &TAG_ACTIVITY_SHOW) boolValue];
}

- (void)setIndicatorStyle:(UIActivityIndicatorViewStyle)style{
    objc_setAssociatedObject(self, &TAG_ACTIVITY_STYLE, [NSNumber numberWithInt:style], OBJC_ASSOCIATION_RETAIN);
}

- (int)getIndicatorStyle{
    return [objc_getAssociatedObject(self, &TAG_ACTIVITY_STYLE) intValue];
}

- (void)addActivityIndicator {
    if (!self.activityIndicator) { // 没有菊花时
        // 以一个自定义形式创建加载菊花
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:[self getIndicatorStyle]];
        // 关闭菊花的autoresize
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;

        dispatch_main_async_safe(^{ // 强行回到主线程执行
            
            // 将菊花加到子view
            [self addSubview:self.activityIndicator];
            
            // 为菊花添加约束 - 水平居中
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.activityIndicator
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1.0
                                                              constant:0.0]];
            // 为菊花添加约束 - 垂直居中
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.activityIndicator
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1.0
                                                              constant:0.0]];
        });
    }

    dispatch_main_async_safe(^{ // 强行回到主线程
        // 菊花开始旋转
        [self.activityIndicator startAnimating];
    });

}

/**
 *  移除菊花的方法
 */
- (void)removeActivityIndicator {
    if (self.activityIndicator) { // 如果菊花存在
        // 把菊花从父视图中移除
        [self.activityIndicator removeFromSuperview];
        // 将菊花指针设为nil
        self.activityIndicator = nil;
    }
}

@end


@implementation UIImageView (WebCacheDeprecated)

- (NSURL *)imageURL {
    return [self sd_imageURL];
}

- (void)setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, cacheType);
        }
    }];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, cacheType);
        }
    }];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, cacheType);
        }
    }];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, cacheType);
        }
    }];
}

- (void)cancelCurrentArrayLoad {
    [self sd_cancelCurrentAnimationImagesLoad];
}

- (void)cancelCurrentImageLoad {
    [self sd_cancelCurrentImageLoad];
}

- (void)setAnimationImagesWithURLs:(NSArray *)arrayOfURLs {
    [self sd_setAnimationImagesWithURLs:arrayOfURLs];
}

@end
