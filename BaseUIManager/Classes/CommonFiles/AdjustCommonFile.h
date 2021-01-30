//
//  AdjustCommonFile.h
//  Pods
//
//  Created by mateen on 2020/12/16.
//

#ifndef AdjustCommonFile_h
#define AdjustCommonFile_h

//adjustTheFont depends on whatever your device is.
#define kAdjustFont(x) [UIFont adjustFontFromFontSize:x]

//define Something for devices
#define  yScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  yScreenHeight  [UIScreen mainScreen].bounds.size.height

//navigationBar height
#define kNavigationBarHeight (kIsIPHONE ? ((kIPhoneX || kIPhoneXR || kIPhoneXS || kIPhoneXSMax || kIphone12Mini || kIphone12Pro || kIphone12ProMax) ? 68 : 44): 50)

//statusBar height
#define kStatusBarHeight 20

//navigationSafetySpaceHeight
#define kNavigationTopSpace ((kIPhoneX || kIPhoneXR || kIPhoneXS || kIPhoneXSMax || kIphone12Mini || kIphone12Pro || kIphone12ProMax) ? 24 : 0)

//bottomSafetySpaceHeight
#define kIphoneXBottomSpace ((kIPhoneX || kIPhoneXR || kIPhoneXS || kIPhoneXSMax || kIphone12Mini || kIphone12Pro || kIphone12ProMax || kIsIpad) ? 34 : 0)

//StatusBarHeight + navigationBarHeight
#define kNavigationHeight (kIsIPHONE ? ((kIPhoneX || kIPhoneXR || kIPhoneXS || kIPhoneXSMax || kIphone12Mini || kIphone12Pro || kIphone12ProMax) ? 88 : 64) : 70)

//tabbar高度
#define kTabbarHeight ((kIPhoneX || kIPhoneXR || kIPhoneXS || kIPhoneXSMax || kIphone12Mini || kIphone12Pro || kIphone12ProMax) ? 83 : 49)

//is iphone?
#define kIsIPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//is ipad?
#define kIsIpad (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

//adjustPercentSize depends on whatever your device is ,（your device physical height / iphone 6's physical height）
#define kPercentageHeight(height) (kIsIPHONE ? (yScreenHeight *height/667): (yScreenHeight *height/1024))
#define kPercentageWidth(width) (kIsIPHONE ? (yScreenWidth / 375 * width): (yScreenWidth / 768 * width))

//the current device is Retina or not device;
#define kIsRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//the current device is iphone or not
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//if it was Ipad
#define kisPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

//if it was iphone 4
#define kIphone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//if it was iphone 5
#define kIphone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//if it was iphone 6
#define kIphone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//if it was iphone 6p
#define kIphone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//if it was iphone x
#define kIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//if it was iphone xr
#define kIPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//if it was iphone xs
#define kIPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)

//判断iPhoneXs Max
#define kIPhoneXSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)
//判断iPHone12 mini
#define kIphone12Mini ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)
//判断iPHone12 和 iPHone12 Pro
#define kIphone12Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)
//判断iPHone12 ProMax
#define kIphone12ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) && !kisPad : NO)
 
//the current systemVersion is iOS 10.0 or not
#define IOS10_OR_LATER ([[[[[UIDevice currentDevice] systemVersion] substringToIndex:1] stringByAppendingString:@"0"] intValue] == 10)

//the current systemVersion is iOS 11.0 or not
#define IOS11_OR_LATER ([[UIDevice currentDevice].systemVersion intValue] >= 11)

#endif /* AdjustCommonFile_h */
