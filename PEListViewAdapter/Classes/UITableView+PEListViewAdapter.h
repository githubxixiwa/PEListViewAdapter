//
//  UITableView+PEListViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/1/24.
//

#import <UIKit/UIKit.h>
#import "PETableViewAutoLayoutAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (PEListViewAdapter)
/// 适配器
@property(nonatomic, strong, readonly) PETableViewAutoLayoutAdapter *adapter;

/// 默认样式
+ (instancetype)tableView;

/// 自定义详细样式
+ (instancetype)tableViewWithFrame:(CGRect)frame sytle:(UITableViewStyle)style cellClasses:(NSArray *)cellClasses;

/// 关联一个适配器
- (void)registerAdapter:(PETableViewAutoLayoutAdapter *)adapter;

/// 刷新界面
- (void)reloadDataWithIsHasMore:(BOOL)isHaveMore;
@end

NS_ASSUME_NONNULL_END
