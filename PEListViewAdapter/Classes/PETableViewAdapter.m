//
//  PETableViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import "PETableViewAdapter.h"


@interface PETableViewAdapter()
@end

@implementation PETableViewAdapter
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowBlock) {
        return self.heightForRowBlock(tableView, indexPath);
    }
    return self.tableView.rowHeight;
}
@end
