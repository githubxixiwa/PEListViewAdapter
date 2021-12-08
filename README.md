# PEListViewAdapter

[![Version](https://img.shields.io/cocoapods/v/PEListViewAdapter.svg?style=flat)](https://cocoapods.org/pods/PEListViewAdapter)
[![License](https://img.shields.io/cocoapods/l/PEListViewAdapter.svg?style=flat)](https://cocoapods.org/pods/PEListViewAdapter)
[![Platform](https://img.shields.io/cocoapods/p/PEListViewAdapter.svg?style=flat)](https://cocoapods.org/pods/PEListViewAdapter)

模仿Android的适配器(Adapter)

## 亮点
* 创建UITableView或UICollectionView时,可以直接注册cellClass数组,或者如果不注册也可以直接使用cell,也可以直接dequeue出来cell
```objc
_collectionView = [UICollectionView collectionViewWithFrame:CGRectZero layout:layout cellClasses:@[UICollectionViewCell.class, XXXCell.class]];

/** 不注册cell直接dequeue也不会闪退原理:
* 添加cell分类重写dequeueReusableCellWithCollectionView:indexPath:方法
*/
+ (instancetype)dequeueReusableCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass(self);
    UICollectionViewCell *cell;
    @try {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    } @catch (NSException *exception) {
        // 如果没有注册cell,补充注册
        [collectionView registerClass:self forCellWithReuseIdentifier:identifier];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    }
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

// 在cellForItemAtIndexPath中,使用以下方法获取cell
XXXCell *cell = [XXXCell dequeueReusableCellWithCollectionView:collectionView indexPath:indexPath];

// tableView方法大致一样
```

* UITableView或UICollectionView的代理方法,使用block回调,跟UITableView或UICollectionView创建的时候一起设置,代码相对比较简洁

## 使用方式

```objc
pod 'PEListViewAdapter'
```

* UITableView

```objc
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView tableViewWithFrame:CGRectMake(0, PEIPhoneXNavHeight, kScreenWidth, kScreenHeight - PEIPhoneXNavHeight) sytle:UITableViewStylePlain cellClasses:@[UITableViewCell.class]];

        // 创建一个适配器
        PETableViewAutoLayoutAdapter *adapter = [PETableViewAutoLayoutAdapter new];
        PEWeakify(self)
        [adapter setRowNumBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
            PEStrongify(self)
            return self.dataArray.count;
        }];
        [adapter setCellForRowBlock:^UITableViewCell *(UITableView * _Nonnull tableView, NSIndexPath *indexPath) {
            PEStrongify(self)
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
            UITableViewCell *cell = [UITableViewCell dequeueReusableCellWithTableView:tableView];
            cell.textLabel.text = self.dataArray[indexPath.row];
            return cell;
        }];
        [adapter setHeightForRowBlock:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath *indexPath) {
            return PEFitSize(70);
        }];
        [adapter setDidSelectRowBlock:^(UITableView * _Nonnull tableView, NSIndexPath *indexPath) {
            NSLog(@"点击了 %@", self.dataArray[indexPath.row]);
        }];
        [_tableView registerAdapter:adapter];
    }
    return _tableView;
}
```

* UICollectionView
```objc
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat spacing = PEFitSize(16);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(PEFitSize(108), PEFitSize(108));
        layout.minimumInteritemSpacing = PEFitSize(9);
        layout.minimumLineSpacing = PEFitSize(9);
        layout.sectionInset = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
        
        _collectionView = [UICollectionView collectionViewWithFrame:CGRectMake(0, PEIPhoneXNavHeight, kScreenWidth, kScreenHeight - PEIPhoneXNavHeight) layout:layout cellClasses:@[UICollectionViewCell.class]];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerID"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];
        
        PECollectionViewAdapter *adapter = [PECollectionViewAdapter new];
        PEWeakify(self)
        [adapter setRowNumBlock:^NSInteger(UICollectionView *collectionView, NSInteger section) {
            PEStrongify(self)
            return self.dataArray.count;
        }];
        [adapter setCellForRowBlock:^UICollectionViewCell *(UICollectionView *collectionView, NSIndexPath *indexPath) {
            PEStrongify(self)
//            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class) forIndexPath:indexPath];
            UICollectionViewCell *cell = [UICollectionViewCell dequeueReusableCellWithCollectionView:collectionView indexPath:indexPath];
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
            label.backgroundColor = PERandomColor;
            return cell;
        }];
        [adapter setDidSelectRowBlock:^(UICollectionView *collectionView, NSIndexPath *indexPath) {
            NSLog(@"点击了 %@", self.dataArray[indexPath.row]);
        }];
        [adapter setSectionHeaderSizeBlock:^CGSize(UICollectionView *collectionView, NSInteger section) {
            return CGSizeMake(kScreenWidth, 100);
        }];
        [adapter setSectionFooterSizeBlock:^CGSize(UICollectionView *collectionView, NSInteger section) {
            return CGSizeMake(kScreenWidth, 200);
        }];
        [adapter setViewForSupplementaryElementOfKindBlock:^UICollectionReusableView *(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath) {
            PEStrongify(self)
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
```
## Author

kunyu.cai, kunyu.cai@poleera.com

## License

PEListViewAdapter is available under the MIT license. See the LICENSE file for more info.
