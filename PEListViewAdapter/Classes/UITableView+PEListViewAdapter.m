//
//  UITableView+PEListViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/1/24.
//

#import "UITableView+PEListViewAdapter.h"
#import <objc/runtime.h>

#import "MJRefresh.h"

static char adapterKey;
@implementation UITableView (PEListViewAdapter)
/// 默认样式
+ (instancetype)tableView {
    return [UITableView tableViewWithFrame:CGRectZero sytle:UITableViewStylePlain cellClasses:@[UITableViewCell.class]];
}

/// 自定义详细样式
+ (instancetype)tableViewWithFrame:(CGRect)frame sytle:(UITableViewStyle)style cellClasses:(NSArray *)cellClasses {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    for (Class cellClass in cellClasses) {
        [tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }
    [tableView setupView];
    return tableView;
}

- (void)setupView {
    self.backgroundColor = UIColor.whiteColor;
    
    self.tableFooterView = [UIView new];
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - private

#pragma mark - publice
/// 关联一个适配器
- (void)registerAdapter:(PETableViewAutoLayoutAdapter *)adapter {
    objc_setAssociatedObject(self, &adapterKey, adapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = adapter;
    self.dataSource = adapter;
    adapter.tableView = self;
}

/// 刷新界面
- (void)reloadDataWithIsHasMore:(BOOL)isHaveMore {
    if (isHaveMore) {
        [self.mj_footer endRefreshing];
    } else {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
    [self reloadData];
}

#pragma mark - get set
- (PETableViewAutoLayoutAdapter *)adapter {
    return objc_getAssociatedObject(self, &adapterKey);
}

#pragma mark - action

#pragma mark - lazyLoad
@end
