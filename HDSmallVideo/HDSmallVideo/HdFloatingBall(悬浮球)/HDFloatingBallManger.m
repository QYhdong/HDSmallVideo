//
//  HDFloatingBallManger.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDFloatingBallManger.h"

@implementation HDFloatingBallManger

//单例对象
+(instancetype)shared{
    static HDFloatingBallManger *manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manger = [[super alloc]init];
        
    });
    
    return manger;
}

-(id<UIViewControllerAnimatedTransitioning>)floatingBallForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
}

-(id<UIViewControllerInteractiveTransitioning>)floatingBallInteractionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    
}

@end
