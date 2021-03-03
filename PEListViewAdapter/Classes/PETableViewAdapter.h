//
//  PETableViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import "PETableViewAutoLayoutAdapter.h"
NS_ASSUME_NONNULL_BEGIN

@interface PETableViewAdapter : PETableViewAutoLayoutAdapter
/// 配置高度
@property(nonatomic, copy) CGFloat ((^heightForRowBlock)(UITableView *tableView, NSIndexPath *indexPath));
@end

NS_ASSUME_NONNULL_END
