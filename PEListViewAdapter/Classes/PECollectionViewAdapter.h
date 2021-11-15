//
//  PECollectionViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PECollectionViewAdapter : NSObject<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
/// 是否显示空页面,默认不显示
@property(nonatomic, assign) BOOL isShowEmptyView;
/// 空页面
@property(nonatomic, strong) UIView *emptyView;

/// collectionView
@property(nonatomic, weak) UICollectionView *collectionView;
/// 返回多少个section
@property(nonatomic, copy) NSInteger ((^sectionNumBlock)(UICollectionView *collectionView));
/// 返回多少个row
@property(nonatomic, copy) NSInteger ((^rowNumBlock)(UICollectionView *collectionView, NSInteger section));
/// 配置cell
@property(nonatomic, copy) CGSize ((^cellSizeForRowBlock)(UICollectionView *collectionView, NSIndexPath *indexPath));
/// 配置cell
@property(nonatomic, copy) UICollectionViewCell * ((^cellForRowBlock)(UICollectionView *collectionView, NSIndexPath *indexPath));
/// 点击cell回调
@property(nonatomic, copy) void ((^didSelectRowBlock)(UICollectionView *collectionView, NSIndexPath *indexPath));

/// 返回每组头部尺寸
@property(nonatomic, copy) CGSize ((^sectionHeaderSizeBlock)(UICollectionView *collectionView, NSInteger section));
/// 返回每组底部尺寸
@property(nonatomic, copy) CGSize ((^sectionFooterSizeBlock)(UICollectionView *collectionView, NSInteger section));
/// 组头组尾回调
@property(nonatomic, copy) UICollectionReusableView * ((^viewForSupplementaryElementOfKindBlock)(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath));

#pragma mark - UIScrollView回调
/// 正在滚动
@property(nonatomic, copy) void ((^didScrollBlock)(UITableView *tableView));
@end

NS_ASSUME_NONNULL_END
