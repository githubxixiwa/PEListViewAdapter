//
//  PECollectionViewAdapter.m
//  PEListViewAdapter
//
//  Created by kunyu.cai on 2020/12/28.
//

#import "PECollectionViewAdapter.h"
#import "MJRefresh.h"

@interface PECollectionViewAdapter ()
@end

@implementation PECollectionViewAdapter
- (void)updateEmptyView:(UICollectionView *)collectionView count:(NSInteger)count {
    if (!self.isShowEmptyView) {
        return;
    }
    if (count == 0 && self.emptyView) {
        self.emptyView.hidden = NO;
        [collectionView addSubview:self.emptyView];
        CGRect frame = collectionView.bounds;
        frame.origin.y = collectionView.contentInset.top;
        if (collectionView.mj_header) {
            frame.origin.y = collectionView.mj_header.scrollViewOriginalInset.top;
        }
        self.emptyView.frame = frame;
    } else {
        self.emptyView.hidden = YES;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellSizeForRowBlock) {
        return self.cellSizeForRowBlock(collectionView, indexPath);
    }
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
    if ([layout isKindOfClass:UICollectionViewFlowLayout.class] && !CGSizeEqualToSize(layout.itemSize, CGSizeZero)) {
        return CGSizeMake(layout.itemSize.width, layout.itemSize.height);
    }
    return CGSizeZero;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.sectionNumBlock) {
        NSInteger count = self.sectionNumBlock(collectionView);
        [self updateEmptyView:collectionView count:count];
        return count;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = 0;
    if (self.rowNumBlock) {
        count = self.rowNumBlock(collectionView, section);
    }
    if (!self.sectionNumBlock) {
        [self updateEmptyView:collectionView count:count];
    }
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellForRowBlock) {
        @try {
            UICollectionViewCell *cell = self.cellForRowBlock(collectionView, indexPath);
            return cell;
        } @catch (NSException *exception) {
        } @finally {
        }
    }
    return [[UICollectionViewCell alloc] initWithFrame:CGRectZero];
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

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.didScrollBlock ?: self.didScrollBlock((UICollectionView *)scrollView);
}
@end
