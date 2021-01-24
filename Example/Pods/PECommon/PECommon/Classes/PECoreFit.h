//
//  PECoreFit.h
//  PECommon
//
//  Created by sky on 2020/11/10.
//
/**
 * 用于屏幕适配
 * 使用375宽度的设计图来设置size,按比例缩放到真实的设备尺寸中
 */

#import <Foundation/Foundation.h>

#define PEFitSize(size)             [PECoreFit sizeWidthScale:(size)]
#define PEFitFont(font)             [UIFont systemFontOfSize:PEFitSize(font)]
#define PEFitBoldFont(font)         [UIFont boldSystemFontOfSize:PEFitSize(font)]
#define PEFitMediumFont(font)         [UIFont fontWithName:@"PingFangSC-Medium" size:PEFitSize(font)]

NS_ASSUME_NONNULL_BEGIN

@interface PECoreFit : NSObject
/**
 按宽度适配
 @param value pd值
 */
+(float)sizeWidthScale:(float)value;

+ (BOOL)isIPhonex;
@end

NS_ASSUME_NONNULL_END
