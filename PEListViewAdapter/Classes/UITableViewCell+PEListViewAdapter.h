//
//  UITableViewCell+PEListViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (PEListViewAdapter)
+ (instancetype)dequeueReusableCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
