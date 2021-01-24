//
//  UIView+PECommonAdd.h
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PECommonAdd)

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.
/// view所在的controller
@property (nullable, nonatomic, readonly) UIViewController *viewController;

/// 移除所有子视图
- (void)removeAllSubview;
/// 切圆角
- (void)setViewRadius:(CGFloat)radius;
/// 部分切圆角方法
- (void)setViewRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;
/// 设置内边框
- (void)setBorder:(UIColor *)borderColor width:(CGFloat)width;
/// 设置投影
- (void)setShadowColor:(UIColor *)color offset:(CGSize)offset opacity:(float)opacity radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
