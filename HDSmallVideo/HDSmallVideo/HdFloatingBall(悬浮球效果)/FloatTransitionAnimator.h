//
//  FloatTransitionAnimator.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/15.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//转场动画类
@interface FloatTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

/** 转场动画类型 push/pop */
@property (nonatomic, assign) UINavigationControllerOperation operation;

+(instancetype)animationWithStartCenter:(CGPoint)center radius:(CGFloat)radius operation:(UINavigationControllerOperation)operation;


/** 替换新动画，用于手势拖动到某个位置，执行缩小动画 */
- (void)replaceAnimation;
/** 继续执行动画，用于控制交互转场，手势结束个的动画执行 */
- (void)continueAnimationWithFastSliding:(BOOL)fastSliding;
/** 更新交互转场的进度 */
- (void)updateInteractiveTransition:(CGFloat)percentComplete;
/** 动画反转，用于手势拖动未达到pop条件时，将动画取消 */
- (void)cancelInteractiveTransition;

@end

NS_ASSUME_NONNULL_END

