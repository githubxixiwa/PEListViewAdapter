//
//  UICollectionView+PEListViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/1/24.
//

#import "UICollectionView+PEListViewAdapter.h"
#import <objc/runtime.h>

#if __has_include(<MJRefresh.h>)
#import "MJRefresh.h"
#endif

static char adapterKey;
@implementation UICollectionView (PEListViewAdapter)
/// 快速构建UICollectionView
/// @param frame frame
/// @param layout layout
/// @param cellClasses 需要注册的cell类 , identifier 为 NSStringFromClass(cellClass)
+ (instancetype)collectionViewWithFrame:(CGRect)frame layout:(UICollectionViewLayout *)layout cellClasses:(NSArray *)cellClasses {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    for (Class cellClass in cellClasses) {
        [collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    }
    [collectionView setupView];
    return collectionView;
}

- (void)setupView {
    self.backgroundColor = UIColor.whiteColor;
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - private

#pragma mark - publice

/// 关联一个适配器
- (void)registerAdapter:(PECollectionViewAdapter *)adapter {
    objc_setAssociatedObject(self, &adapterKey, adapter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = adapter;
    self.dataSource = adapter;
    adapter.collectionView = self;
}

/// 刷新界面
- (void)reloadDataWithIsHasMore:(BOOL)isHaveMore {
#if __has_include(<MJRefresh.h>)
    if (isHaveMore) {
        [self.mj_footer endRefreshing];
    } else {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
#endif
    [self reloadData];
}

#pragma mark - get set
- (PECollectionViewAdapter *)adapter {
    return objc_getAssociatedObject(self, &adapterKey);
}

#pragma mark - action

#pragma mark - lazyLoad
@end
