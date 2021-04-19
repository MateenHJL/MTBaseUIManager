//
//  UIFont+AdjustFont.m
//  HotelGGDBEnterprise
//
//  Created by MaTeen on 15/9/16.
//  Copyright (c) 2015年 MaTeen. All rights reserved.
//

#import "UIFont+AdjustFont.h"
#import <BaseUIManager/AdjustCommonFile.h>

@implementation UIFont (AdjustFont)

+ (CGFloat)adjustFontFromFontSize:(CGFloat)size
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait)
        {
            return size * [[UIScreen mainScreen]bounds].size.width / 375.0;
        }
        else if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            return size * [[UIScreen mainScreen]bounds].size.height / 667.0;
        }
        return size * [[UIScreen mainScreen]bounds].size.width / 375.0;
    }
    else
    {
        if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait)
        {
            return size * [UIScreen mainScreen].bounds.size.width / 768.0;
        }
        else if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            return size * [[UIScreen mainScreen]bounds].size.height / 1024.0;
        }
        return size * [UIScreen mainScreen].bounds.size.width / 768.0;
    }
}

@end
