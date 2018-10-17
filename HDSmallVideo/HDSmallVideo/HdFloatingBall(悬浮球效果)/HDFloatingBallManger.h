//
//  HDFloatingBallManger.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kPopInteractiveKey;
extern NSString *const kAnimatorKey;
//该pop为右滑手势
extern NSString *const kPopWithPanGes;

@interface HDFloatingBallManger : NSObject

//单例对象
+(instancetype)shared;

//添加需要监控添加悬浮球的控制器类名
- (void)addFloatMonitorVCClasses:(NSArray<NSString *> *)VCClasses;

//转场动画
-(id<UIViewControllerAnimatedTransitioning>)floatingBallForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;

//交互
-(id<UIViewControllerInteractiveTransitioning>)floatingBallInteractionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController;


-(void)didShowViewController:(UIViewController *)viewController navigationController:(UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END
