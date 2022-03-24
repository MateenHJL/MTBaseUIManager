//
//  MTAppDelegate.m
//  BaseUIManager
//
//  Created by 455528514@qq.com on 12/15/2020.
//  Copyright (c) 2020 455528514@qq.com. All rights reserved.
//

#import "MTAppDelegate.h"
#import "TestViewController.h"
#import "TableViewController.h"
#import <BaseUIManager/CommonFile.h>

@implementation MTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[TestViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
 

@end
