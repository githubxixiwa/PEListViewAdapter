//
//  PECollectionViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import "PECollectionViewAdapter.h"

@interface PECollectionViewAdapter ()
/// 空view
@property(nonatomic, strong) UIView *emptyView;
@end

@implementation PECollectionViewAdapter
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.sectionNumBlock) {
        return self.sectionNumBlock(collectionView);
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = 0;
    if (self.rowNumBlock) {
        count = self.rowNumBlock(collectionView, section);
    }
    if (count == 0 && self.emptyViewBlock) {
        if (self.emptyView) {
            [self.emptyView removeFromSuperview];
        }
        self.emptyView = self.emptyViewBlock(collectionView, self.emptyView);
        if (self.emptyView) {
            [self.collectionView addSubview:self.emptyView];
            self.emptyView.frame = self.collectionView.bounds;
        }
    } else {
        [self.emptyView removeFromSuperview];
    }
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellForRowBlock) {
        return self.cellForRowBlock(collectionView, indexPath);
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (self.sectionHeaderSizeBlock) {
        return self.sectionHeaderSizeBlock(collectionView, section);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (self.sectionFooterSizeBlock) {
        return self.sectionFooterSizeBlock(collectionView, section);
    }
    return CGSizeZero;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (self.viewForSupplementaryElementOfKindBlock) {
        return self.viewForSupplementaryElementOfKindBlock(collectionView, kind, indexPath);
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectRowBlock) {
        self.didSelectRowBlock(collectionView, indexPath);
    }
}
@end
