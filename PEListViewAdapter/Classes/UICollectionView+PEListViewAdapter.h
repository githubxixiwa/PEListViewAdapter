//
//  UICollectionView+PEListViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/1/24.
//

#import <UIKit/UIKit.h>
#import "PECollectionViewAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (PEListViewAdapter)
/// 适配器
@property(nonatomic, strong, readonly) PECollectionViewAdapter *adapter;

/// 快速构建PECollectionView
/// @param frame frame
/// @param layout layout
/// @param cellClasses 需要注册的cell类 , identifier 为 NSStringFromClass(cellClass)
+ (instancetype)collectionViewWithFrame:(CGRect)frame layout:(UICollectionViewLayout *)layout cellClasses:(NSArray *)cellClasses;

/// 快速构建PECollectionView
+ (instancetype)collectionViewWithLayout:(UICollectionViewLayout *)layout;
+ (instancetype)collectionViewWithFrame:(CGRect)frame layout:(UICollectionViewLayout *)layout;

/// 关联一个适配器
- (void)registerAdapter:(PECollectionViewAdapter *)adapter;

/// 刷新界面
- (void)reloadDataWithIsHasMore:(BOOL)isHaveMore;

- (UICollectionViewCell *)dequeueReusableCell:(Class)cellClass indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
