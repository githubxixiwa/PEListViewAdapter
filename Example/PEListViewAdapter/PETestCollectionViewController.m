//
//  PETestCollectionViewController.m
//  PEListView_Example
//
//  Created by kunyu.cai on 2021/1/22.
//  Copyright © 2021 Pole Era. All rights reserved.
//

#import "PETestCollectionViewController.h"
#import "PEListViewAdapter.h"

@interface PETestCollectionViewController ()
/// tableView
@property(nonatomic, strong) UICollectionView *collectionView;
/// 数据
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation PETestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PECollectionView用法";
    
    self.dataArray = @[@"橙子", @"苹果", @"香蕉", @"莴苣", @"西红柿", @"牛奶", @"奶酪", @"鸡蛋", @"鸭蛋", @"牛肉", @"猪肉"];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - lazyLoad
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat spacing = 16;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(108, 108);
        layout.minimumInteritemSpacing = 9;
        layout.minimumLineSpacing = 9;
        layout.sectionInset = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
        
        _collectionView = [UICollectionView collectionViewWithFrame:self.view.bounds layout:layout cellClasses:@[UICollectionViewCell.class]];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerID"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];
        
        PECollectionViewAdapter *adapter = [PECollectionViewAdapter new];
        __weak typeof(self) weakSelf = self;
        [adapter setRowNumBlock:^NSInteger(UICollectionView *collectionView, NSInteger section) {
            return weakSelf.dataArray.count;
        }];
        [adapter setCellForRowBlock:^UICollectionViewCell *(UICollectionView *collectionView, NSIndexPath *indexPath) {
            UICollectionViewCell *cell = [collectionView dequeueReusableCell:UICollectionViewCell.class indexPath:indexPath];
            UILabel *label = [cell viewWithTag:23524];
            if (!label) {
                label = [UILabel new];
                label.tag = 23524;
                [cell.contentView addSubview:label];
                label.textColor = UIColor.blackColor;
                label.textAlignment = NSTextAlignmentCenter;
            }
            label.frame = cell.bounds;
            label.text = self.dataArray[indexPath.row];
            label.backgroundColor = UIColor.whiteColor;
            return cell;
        }];
        [adapter setDidSelectRowBlock:^(UICollectionView *collectionView, NSIndexPath *indexPath) {
            NSLog(@"点击了 %@", self.dataArray[indexPath.row]);
        }];
        [adapter setSectionHeaderSizeBlock:^CGSize(UICollectionView *collectionView, NSInteger section) {
            return CGSizeMake(weakSelf.view.bounds.size.width, 100);
        }];
        [adapter setSectionFooterSizeBlock:^CGSize(UICollectionView *collectionView, NSInteger section) {
            return CGSizeMake(weakSelf.view.bounds.size.width, 200);
        }];
        [adapter setViewForSupplementaryElementOfKindBlock:^UICollectionReusableView *(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath) {
            UICollectionReusableView *reusableView = nil;
            if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
                reusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerID" forIndexPath:indexPath];
                reusableView.backgroundColor = UIColor.redColor;
            } else if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                reusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID" forIndexPath:indexPath];
                reusableView.backgroundColor = UIColor.blueColor;
            }
            return reusableView;
        }];
        [_collectionView registerAdapter:adapter];
    }
    return _collectionView;
}
@end
