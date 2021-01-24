//
//  UIViewController+PEAdd.m
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#import "UIViewController+PEAdd.h"

@implementation UIViewController (PEAdd)
#pragma mark - 获取当前最顶层的UINavigationController
+ (UINavigationController *)currentNavigationController {
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (!rootViewController) {
        return nil;
    }

    while (rootViewController.presentedViewController) {
        rootViewController = rootViewController.presentedViewController;
    }

    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UINavigationController *navigationController = ((UITabBarController *)rootViewController).selectedViewController;
        while (navigationController.presentedViewController && [navigationController.presentedViewController isKindOfClass:UINavigationController.class]) {
            navigationController = (UINavigationController *)navigationController.presentedViewController;
        }
        return navigationController;
    }

    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        while (navigationController.presentedViewController && [navigationController.presentedViewController isKindOfClass:UINavigationController.class]) {
            navigationController = (UINavigationController *)navigationController.presentedViewController;
        }
        return navigationController;
    }

    return nil;
}

#pragma mark - 获取当前最顶层的UINavigationController的最顶层的viewcontroller
+ (UIViewController *)currentTopViewController {
    UIViewController *topViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([topViewController isKindOfClass:UITabBarController.class]) {
        
    } else {
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            if (topViewController.presentedViewController) {
                
            } else {
                topViewController = ((UINavigationController *)topViewController).topViewController;
            }
        }
    }
    while (topViewController.presentedViewController) {
        topViewController = topViewController.presentedViewController;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            if (topViewController.presentedViewController) {
                
            } else {
                topViewController = ((UINavigationController *)topViewController).topViewController;
            }
        }
    }
    return topViewController;
}

@end
