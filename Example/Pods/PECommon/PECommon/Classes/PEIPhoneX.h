//
//  PEIPhoneX.h
//  PECommon
//
//  Created by sky on 2020/11/10.
//

#ifndef PEIPhoneX_h
#define PEIPhoneX_h

#pragma mark - 适配全面屏
//是否是手机
#define PEIsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//是否是iphoneX
#define PEIsIPhoneX PECoreFit.isIPhonex

//底部安全高度
#define PEIPhoneXBottonSafeHeight (PEIsIPhoneX ? 34 : 0)
//系统手势高度
#define PEIPhoneXSystenGestureHeight (PEIsIPhoneX ? 13 : 0)
//tabbar高度
#define PEIPhoneXTabBarHeight (49 + IPhoneXBottonSafeHeight)
//状态栏高度
#define PEIPhoneXStatusHeight (PEIsIPhoneX ? 44 : 20)
//隐藏状态栏后的状态栏高度
#define PEIPhoneXStatusHeightNOStatus (PEIsIPhoneX ? 44 : 0)
//导航栏高度
#define PEIPhoneXNavHeight (PEIsIPhoneX ? 88 : 64)

#endif /* PEIPhoneX_h */
