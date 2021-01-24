//
//  PETableViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import "PETableViewAdapter.h"


@interface PETableViewAdapter()
/// 显示空提示的view
@property(nonatomic, strong) UIView *emptyView;
@end

@implementation PETableViewAdapter
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.sectionNumBlock) {
        return self.sectionNumBlock(tableView);
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    if (self.rowNumBlock) {
        count = self.rowNumBlock(tableView, section);
    }
    if (count == 0 && self.emptyViewBlock) {
        if (self.emptyView) {
            [self.emptyView removeFromSuperview];
        }
        self.emptyView = self.emptyViewBlock(tableView, self.emptyView);
        if (self.emptyView) {
            [self.tableView addSubview:self.emptyView];
            self.emptyView.frame = self.tableView.bounds;
        }
    } else {
        [self.emptyView removeFromSuperview];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForRowBlock) {
        return self.cellForRowBlock(tableView, indexPath);
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"unkownCellID"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowBlock) {
        return self.heightForRowBlock(tableView, indexPath);
    }
    return self.tableView.rowHeight;
}

#pragma mark - UITableViewDelegate
/// 选中了某一行cell的时候就会调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectRowBlock) {
        self.didSelectRowBlock(tableView, indexPath);
    }
}
@end
