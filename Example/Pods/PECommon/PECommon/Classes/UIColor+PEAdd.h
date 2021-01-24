//
//  UIColor+PEAdd.h
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#import <UIKit/UIKit.h>

#pragma mark - 颜色定义
// 快速创造hexColor支持暗黑模式
#define PEHexColorAndDarkColor(colorStr, darkColorStr) [UIColor colorWithHexString:colorStr darkHexString:darkColorStr]
// 快速创造hexColor
#define PEHexColor(colorStr) [UIColor colorWithHexString:colorStr]
// 快速创造随机颜色
#define PERandomColor [UIColor colorWithRed:(arc4random()%255) / 255.0f green:(arc4random()%255) / 255.0f blue:(arc4random()%255) / 255.0f alpha:1]
// 快速创造RGB颜色
#define PERGBColor(R, G, B) [UIColor colorWithRed:(R) / 255.0f green:(G) / 255.0f blue:(B) / 255.0f alpha:1]
// 快速创造RGBA颜色
#define PERGBAColor(R, G, B, A) [UIColor colorWithRed:(R) / 255.0f green:(G) / 255.0f blue:(B) / 255.0f alpha:A]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (PEAdd)
/// hexStr 转 UIColor
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;

/// hexStr 转 UIColor 支持暗黑模式
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr darkHexString:(NSString *)darkHexStr;
@end

NS_ASSUME_NONNULL_END
