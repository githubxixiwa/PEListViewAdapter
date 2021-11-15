//
//  PETableViewAutoLayoutAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PETableViewAutoLayoutAdapter : NSObject<UITableViewDelegate, UITableViewDataSource>
/// 是否显示空页面,默认不显示
@property(nonatomic, assign) BOOL isShowEmptyView;
/// 空页面
@property(nonatomic, strong) UIView *emptyView;

/// tableView
@property(nonatomic, weak) UITableView *tableView;
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^sectionNumBlock)(UITableView *tableView));
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^rowNumBlock)(UITableView *tableView, NSInteger section));
/// 模糊的配置高度
@property(nonatomic, copy) CGFloat ((^estimatedHeightForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 配置高度
@property(nonatomic, copy) CGFloat ((^heightForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 配置cell
@property(nonatomic, copy) UITableViewCell * ((^cellForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 点击cell回调
@property(nonatomic, copy) void ((^didSelectRowBlock)(UITableView *tableView, NSIndexPath *indexPath));

#pragma mark - section header or footer
/// header高度
@property(nonatomic, copy) CGFloat ((^heightForHeaderInSectionBlock)(UITableView *tableView, NSInteger section));
/// footer高度
@property(nonatomic, copy) CGFloat ((^heightForFooterInSectionBlock)(UITableView *tableView, NSInteger section));
/// header View
@property(nonatomic, copy) UIView * ((^viewForHeaderInSectionBlock)(UITableView *tableView, NSInteger section));
/// footer View
@property(nonatomic, copy) UIView * ((^viewForFooterInSectionBlock)(UITableView *tableView, NSInteger section));

#pragma mark - 编辑相关
/// 是否可以编辑
@property(nonatomic, copy) BOOL ((^canEditRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 编辑回调
@property(nonatomic, copy) void ((^commitEditingBlock)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath));
/// 编辑样式
@property(nonatomic, copy) UITableViewCellEditingStyle ((^editingStyleForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
/// 编辑按钮文字
@property(nonatomic, copy) NSString * ((^titleForDeleteConfirmationButtonForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));

#pragma mark - UIScrollView回调
/// 正在滚动
@property(nonatomic, copy) void ((^didScrollBlock)(UITableView *tableView));
@end

NS_ASSUME_NONNULL_END
