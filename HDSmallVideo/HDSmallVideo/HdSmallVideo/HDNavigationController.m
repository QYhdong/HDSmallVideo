//
//  HDNavigationController.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDNavigationController.h"
#import "HDFloatingBallManger.h"

@interface HDNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation HDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

//代理方法
//自定义转场动画
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [[HDFloatingBallManger shared] floatingBallForOperation:operation fromViewController:fromVC toViewController:toVC];
}

//用户交互
-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return [[HDFloatingBallManger shared] floatingBallInteractionControllerForAnimationController:animationController];
}

//添加滑动手势
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [[HDFloatingBallManger shared] didShowViewController:viewController navigationController:navigationController];
    
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    if (self.viewControllers.count <= 1){
        return NO;
    }
    return YES;
}


@end
