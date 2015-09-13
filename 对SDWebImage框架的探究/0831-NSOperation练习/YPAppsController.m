//
//  YPAppsController.m
//  0831-NSOperation练习
//
//  Created by 胡云鹏 on 15/8/31.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//


#import "YPAppsController.h"
#import "App.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"

@interface YPAppsController ()
/**
 *  所有的应用数据
 */
@property (nonatomic, strong) NSMutableArray *apps;

@end

@implementation YPAppsController


- (NSMutableArray *)apps
{
    if (!_apps) {
        _apps = [NSMutableArray array];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        _apps = [App objectArrayWithKeyValuesArray:dictArray];
    }
    return _apps;
}

#pragma mark - 初始化方法 -
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
/**
 *  1.会阻塞主线程 - 影响用户体验
 *  2.会重复下载 - 浪费流量,浪费时间
 *  ------------------------------------
 *  保证:1张图片只下载1次
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"app";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    App *app = self.apps[indexPath.row];
    cell.textLabel.text = app.name;
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.cover_image] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.cover_image]  placeholderImage:nil options:SDWebImageRetryFailed];
    
    return cell;
}





@end
