//
//  NSObject+BottomSafeViewHeight.m
//  Slim_Student
//
//  Created by Sumansoul on 2021/6/4.
//

#import "NSObject+BottomSafeViewHeight.h"

@implementation NSObject (BottomSafeViewHeight)

- (BOOL)kIsBottomViewSafeView
{
    if (@available(iOS 11.0, *))
    {
        return [UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom > 0;
    }
    return NO;
}

@end
