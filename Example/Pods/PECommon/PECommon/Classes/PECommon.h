//
//  PECommon.h
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#ifndef PECommon_h
#define PECommon_h

#import "PECoreFit.h"
#import "PEIPhoneX.h"
#import "UIColor+PEAdd.h"
#import "UIView+PECommonAdd.h"
#import "UIViewController+PEAdd.h"

#pragma mark - 屏幕尺寸相关
#ifndef kScreenWidth
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#endif

#pragma mark - 字符串安全
#define PESafeString(string) ([string isKindOfClass:NSString.class]?string:@"")

#pragma mark - 图片
// 快速创建图片
#define PEImage(imageStr) [UIImage imageNamed:imageStr]

#pragma mark - url
// 快速创建url
#define PEURL(urlString) [NSURL URLWithString:urlString]

#pragma mark - weakify strongify
#ifndef PEWeakify
#define PEWeakify( x ) \
__weak typeof(x) __weak_##x##__ = x;
#endif

#ifndef PEStrongify
#define PEStrongify( x ) \
__strong typeof(x) x = __weak_##x##__;
#endif

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif /* PECommon_h */
