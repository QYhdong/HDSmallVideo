//
//  HDFloatingBallManger.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDFloatingBallManger.h"
#import "FloatTransitionAnimator.h"

@interface HDFloatingBallManger()<UIGestureRecognizerDelegate>

//需要监控的类
@property (nonatomic,strong) NSMutableArray<NSString *> *monitorVcClasses;



@end

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

-(void)didShowViewController:(UIViewController *)viewController navigationController:(UINavigationController *)navigationController{
    
    if ([self.monitorVcClasses containsObject:NSStringFromClass([viewController class])]){
        
        navigationController.interactivePopGestureRecognizer.enabled = NO;
        //边缘手势
        UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handleNavigationTransition:)];
        gesture.edges = UIRectEdgeLeft;
        gesture.delegate = self;
        [viewController.view addGestureRecognizer:gesture];
    
    }else{
        navigationController.interactivePopGestureRecognizer.enabled = YES;
        
        }
}

#pragma mark 返回手势
-(void)handleNavigationTransition:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer{
    
    
    
}

@end
