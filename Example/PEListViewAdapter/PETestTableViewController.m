//
//  PETestTableViewController.m
//  PEListView_Example
//
//  Created by kunyu.cai on 2021/1/22.
//  Copyright © 2021 Pole Era. All rights reserved.
//

#import "PETestTableViewController.h"
#import "UITableView+PEListViewAdapter.h"
#import "PECommon.h"

@interface PETestTableViewController ()
/// tableView
@property(nonatomic, strong) UITableView *tableView;
/// 数据
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation PETestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PETableView用法";
    
    self.dataArray = @[@"橙子", @"苹果", @"香蕉", @"莴苣", @"西红柿", @"牛奶", @"奶酪", @"鸡蛋", @"鸭蛋", @"牛肉", @"猪肉"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - lazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView tableViewWithFrame:CGRectMake(0, PEIPhoneXNavHeight, kScreenWidth, kScreenHeight - PEIPhoneXNavHeight) sytle:UITableViewStylePlain cellClasses:@[UITableViewCell.class]];

        // 创建一个适配器
        PETableViewAutoLayoutAdapter *adapter = [PETableViewAutoLayoutAdapter new];
        PEWeakify(self)
        [adapter setRowNumBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
            PEStrongify(self)
            return self.dataArray.count;
        }];
        [adapter setCellForRowBlock:^UITableViewCell *(UITableView * _Nonnull tableView, NSIndexPath *indexPath) {
            PEStrongify(self)
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
            cell.textLabel.text = self.dataArray[indexPath.row];
            return cell;
        }];
        [adapter setHeightForRowBlock:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath *indexPath) {
            return PEFitSize(70);
        }];
        [adapter setDidSelectRowBlock:^(UITableView * _Nonnull tableView, NSIndexPath *indexPath) {
            NSLog(@"点击了 %@", self.dataArray[indexPath.row]);
        }];
        [_tableView registerAdapter:adapter];
    }
    return _tableView;
}


@end
