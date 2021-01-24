//
//  PECoreFit.m
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#import "PECoreFit.h"

static CGFloat _scale;

@implementation PECoreFit
+ (void)load {
    _scale = [UIScreen mainScreen].bounds.size.width / 375.0;
}

+(float)sizeWidthScale:(float)value{
    return (float) (_scale * value);
}

+ (BOOL)isIPhonex {
    if (@available(iOS 11.0, *)) {
        return [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0;
    } else {
        return NO;
    }
}
@end
