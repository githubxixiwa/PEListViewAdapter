//
//  PETableViewAutoLayoutAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PETableViewAutoLayoutAdapter : NSObject<UITableViewDelegate, UITableViewDataSource>
/// tableView
@property(nonatomic, weak) UITableView *tableView;
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^sectionNumBlock)(UITableView *tableView));
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^rowNumBlock)(UITableView *tableView, NSInteger section));
/// 配置cell
@property(nonatomic, copy) UITableViewCell * ((^cellForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 点击cell回调
@property(nonatomic, copy) void ((^didSelectRowBlock)(UITableView *tableView, NSIndexPath *indexPath));

/// 是否显示空页面回调
@property(nonatomic, copy) UIView * ((^emptyViewBlock)(UITableView *tableView, UIView *oldEmptyView));

#pragma mark - UIScrollView回调
/// 正在滚动
@property(nonatomic, copy) void ((^didScrollBlock)(UITableView *tableView));
@end

NS_ASSUME_NONNULL_END
