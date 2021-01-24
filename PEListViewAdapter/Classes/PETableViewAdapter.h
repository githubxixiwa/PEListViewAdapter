//
//  PETableViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PETableViewAdapter : NSObject<UITableViewDelegate, UITableViewDataSource>
/// tableView
@property(nonatomic, weak) UITableView *tableView;
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^sectionNumBlock)(UITableView *tableView));
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^rowNumBlock)(UITableView *tableView, NSInteger section));
/// 配置cell
@property(nonatomic, copy) UITableViewCell * ((^cellForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 配置高度
@property(nonatomic, copy) CGFloat ((^heightForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 点击cell回调
@property(nonatomic, copy) void ((^didSelectRowBlock)(UITableView *tableView, NSIndexPath *indexPath));

/// 是否显示空页面回调
@property(nonatomic, copy) UIView * ((^emptyViewBlock)(UITableView *tableView, UIView *oldEmptyView));
@end

NS_ASSUME_NONNULL_END
