//
//  HDFloatingBallManger.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDFloatingBallManger.h"
#import "FloatTransitionAnimator.h"

//悬浮球宽高
#define FloatWidth  60

NSString *const kPopInteractiveKey = @"kPopInteractiveKey";
NSString *const kAnimatorKey = @"kAnimatorKey";
//是否为右滑手势引起的pop操作
NSString *const kPopWithPanGes = @"kPopWithPanGes";

@interface HDFloatingBallManger()<UIGestureRecognizerDelegate>

//需要监控的类
@property (nonatomic,strong) NSMutableArray<NSString *> *monitorVcClasses;

// 悬浮球加载的控制器
@property (nonatomic, strong) UIViewController *floatViewController;
//悬浮球
@property (nonatomic, strong) UIImageView *floatView;

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
    FloatTransitionAnimator *animator;
    UIViewController *vc;
    if (operation == UINavigationControllerOperationPush){
        if (toVC == self.floatViewController){
            animator = [self createAnimatorWithOperation:operation];
        }
    }
    return animator;
}

-(id<UIViewControllerInteractiveTransitioning>)floatingBallInteractionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    UIPercentDrivenInteractiveTransition *interactive = [UIPercentDrivenInteractiveTransition new];
    return interactive;
}

- (FloatTransitionAnimator *)createAnimatorWithOperation:(UINavigationControllerOperation)operation
{
    return [FloatTransitionAnimator animationWithStartCenter:self.floatView.center radius:FloatWidth / 2.0 operation:operation];

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
