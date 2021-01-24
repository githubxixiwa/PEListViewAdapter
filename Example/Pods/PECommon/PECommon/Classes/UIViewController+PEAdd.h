//
//  UIViewController+PEAdd.h
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PEAdd)
/**
 获取当前最顶层的NavigationController

 @return UINavigationController
 */
+ (UINavigationController *)currentNavigationController;

/**
 获取当前最顶层的NavigationController的最顶层的viewcontroller

 @return UIViewController
 */
+ (UIViewController *)currentTopViewController;
@end

NS_ASSUME_NONNULL_END
