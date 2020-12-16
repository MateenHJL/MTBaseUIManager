//
//  OneButtonViewModel.m
//  YouSuHuoPinDot
//
//  Created by Teen Ma on 2017/11/7.
//  Copyright © 2017年 Teen Ma. All rights reserved.
//

#import "OneButtonViewModel.h"

@implementation OneButtonViewModel

- (instancetype)init
{
    if (self = [super init])
    {
        self.space = 20;
        self.buttonBackgroundColor = rgb(238, 238, 238);
        self.textColor = rgb(51, 51, 51);
        self.cornerRadius = 22;
        self.hasAnimation = NO;
        self.isGradientStyle = NO;
        self.colors = [NSArray arrayWithObjects:(id)rgb(254, 225, 0), rgb(255, 202, 32), nil];
        self.superViewWdith = [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}

@end
