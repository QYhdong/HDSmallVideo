//
//  UIViewController+CurrentViewController.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "UIViewController+CurrentViewController.h"

@implementation UIViewController (CurrentViewController)

+(UIViewController *)currentViewController{
    
    UIViewController *result = nil;
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    result = [self getCurrentVCFrom:rootViewController];
    return result;
    
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}

+ (UINavigationController *)currentNavigationController
{
    return [self currentViewController].navigationController;
}

+ (UITabBarController *)currentTabBarController
{
    return [self currentViewController].tabBarController;
}

@end
