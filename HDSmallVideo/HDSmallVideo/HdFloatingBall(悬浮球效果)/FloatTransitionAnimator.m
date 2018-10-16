//
//  FloatTransitionAnimator.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "FloatTransitionAnimator.h"

//转场动画时间
#define AnimationDuration 0.35

@interface FloatTransitionAnimator()

//转场动画类型 push/pop
@property (nonatomic, assign) UINavigationControllerOperation operation;
//悬浮球圆心坐标
@property (nonatomic, assign, readonly) CGPoint center;
//悬浮球半径
@property (nonatomic, assign, readonly) CGFloat radius;
//遮罩
@property(nonatomic, strong, readonly) UIView *coverView;

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation FloatTransitionAnimator

+(instancetype)animationWithStartCenter:(CGPoint)center radius:(CGFloat)radius operation:(UINavigationControllerOperation)operation{
    
    return [[self alloc] initWithStartCenter:center radius:radius operation:operation];
    
}

- (instancetype)initWithStartCenter:(CGPoint)center
                             radius:(CGFloat)radius
                          operation:(UINavigationControllerOperation)operation{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;
    
    if (_operation == UINavigationControllerOperationPush){ //push
        
        
        
    }else{  //pop
        
        
        
    }
}

//push动画
-(void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    }

//pop动画


- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return AnimationDuration;
}

@end


