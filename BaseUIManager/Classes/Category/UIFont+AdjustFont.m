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
        return size * [[UIScreen mainScreen]bounds].size.width / 375.0;
    }
    else
    {
        return size * [UIScreen mainScreen].bounds.size.width / 768.0;
    }
}

@end
