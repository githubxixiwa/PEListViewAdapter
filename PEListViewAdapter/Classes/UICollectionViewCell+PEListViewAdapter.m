//
//  UICollectionViewCell+PEListViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2021/7/22.
//

#import "UICollectionViewCell+PEListViewAdapter.h"
@implementation UICollectionViewCell (PEListViewAdapter)

+ (instancetype)dequeueReusableCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass(self);
    UICollectionViewCell *cell;
    @try {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    } @catch (NSException *exception) {
        [collectionView registerClass:self forCellWithReuseIdentifier:identifier];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    }
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}
@end
