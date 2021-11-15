//
//  PETableViewAutoLayoutAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/2/2.
//

#import "PETableViewAutoLayoutAdapter.h"
#import "MJRefresh.h"

@interface PETableViewAutoLayoutAdapter()
@end

@implementation PETableViewAutoLayoutAdapter

- (void)updateEmptyView:(UITableView *)tableView count:(NSInteger)count {
    if (!self.isShowEmptyView) {
        return;
    }
    if (count == 0 && self.emptyView) {
        self.emptyView.hidden = NO;
        [tableView addSubview:self.emptyView];
        CGRect frame = tableView.bounds;
        frame.origin.y = tableView.contentInset.top;
        if (tableView.mj_header) {
            frame.origin.y = tableView.mj_header.scrollViewOriginalInset.top;
        }
        self.emptyView.frame = frame;
    } else {
        self.emptyView.hidden = YES;
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.sectionNumBlock) {
        NSInteger count = self.sectionNumBlock(tableView);
        [self updateEmptyView:tableView count:count];
        return count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    if (self.rowNumBlock) {
        count = self.rowNumBlock(tableView, section);
    }
    if (!self.sectionNumBlock) {
        [self updateEmptyView:tableView count:count];
    }
    
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.estimatedHeightForRowBlock) {
        return self.estimatedHeightForRowBlock(tableView, indexPath);
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowBlock) {
        return self.heightForRowBlock(tableView, indexPath);
    }
    if (tableView.rowHeight > 0) {
        return tableView.rowHeight;
    }
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForRowBlock) {
        @try {
            UITableViewCell *cell = self.cellForRowBlock(tableView, indexPath);
            return cell;
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"unkownCellID"];
}

#pragma mark - section header or footer
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.heightForHeaderInSectionBlock) {
        return self.heightForHeaderInSectionBlock(tableView, section);
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.heightForFooterInSectionBlock) {
        return self.heightForFooterInSectionBlock(tableView, section);
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.viewForHeaderInSectionBlock) {
        return self.viewForHeaderInSectionBlock(tableView, section);
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.viewForFooterInSectionBlock) {
        return self.viewForFooterInSectionBlock(tableView, section);
    }
    return nil;
}

#pragma mark - 编辑相关
/// 是否可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL isCanEdit = NO;
    if (self.canEditRowBlock) {
        isCanEdit = self.canEditRowBlock(tableView, indexPath);
    }
    return isCanEdit;
}

/// 编辑回调
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    !self.commitEditingBlock ?: self.commitEditingBlock(tableView, editingStyle, indexPath);
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.editingStyleForRowBlock) {
        return self.editingStyleForRowBlock(tableView, indexPath);
    }
    return UITableViewCellEditingStyleNone;
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.titleForDeleteConfirmationButtonForRowBlock) {
        return self.titleForDeleteConfirmationButtonForRowBlock(tableView, indexPath);
    }
    return @"删除";
}

#pragma mark - UITableViewDelegate
/// 选中了某一行cell的时候就会调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectRowBlock) {
        self.didSelectRowBlock(tableView, indexPath);
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.didScrollBlock ?: self.didScrollBlock((UITableView *)scrollView);
}
@end
