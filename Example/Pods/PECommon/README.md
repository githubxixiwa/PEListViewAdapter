<!--
 * @Author: 蔡坤育
 * @Date: 2020-11-10 15:05:24
 * @Descripttion: 描述
-->
# PECommon

## 最基础最少代码的工具包
我们在开发项目或者各种组件过程中,都会用到很多通用的宏或者工具类,很多人可能直接copy之前的项目的代码或者依赖一些优秀的第三方kit,例如YYKit.但是这么做要么产生代码冗余,要么依赖很多压根不会使用到的东西.
本组件提供最最基本的宏或者工具类,非常适合在开发组件或者demo中使用.

## 使用方式
1. Add `pod 'PECommon'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<PECommon/PECommon.h\>.

#### PECommon.h
常用的宏定义

#### PECoreFit
用于屏幕适配
```objc
CGFloat size = [PECoreFit sizeWidthScale:designSize];
// 或者使用宏定义
CGFloat size = PEFitSize(designSize);
```

#### PEIPhoneX
用于适配全面屏,快捷的获取状态栏高度\导航栏高度\tabbar高度\底部安全高度

#### UIColor+PEAdd分类
十六进制颜色转换和快捷的生成颜色的宏定义
```objc
PEHexColor(@"#FFFFFF")
```

#### UIView+PECommonAdd分类
UIView常用的方法
快捷的设置圆角\边框\阴影

#### UIViewController+PEAdd
UIViewController常用的方法


## TODO
1.添加Demo
