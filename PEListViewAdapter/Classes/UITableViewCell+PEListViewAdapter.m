//
//  UITableViewCell+PEListViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/7/22.
//

#import "UITableViewCell+PEListViewAdapter.h"

@implementation UITableViewCell (PEListViewAdapter)
+ (instancetype)dequeueReusableCellWithTableView:(UITableView *)tableView {
    NSString *identifier = NSStringFromClass(self);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}
@end
