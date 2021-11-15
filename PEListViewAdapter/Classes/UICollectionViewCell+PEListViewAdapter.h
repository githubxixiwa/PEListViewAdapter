//
//  UICollectionViewCell+PEListViewAdapter.h
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (PEListViewAdapter)
+ (instancetype)dequeueReusableCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
