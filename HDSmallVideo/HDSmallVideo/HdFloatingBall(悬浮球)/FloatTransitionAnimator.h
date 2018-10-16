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


+(instancetype)animationWithStartCenter:(CGPoint)center radius:(CGFloat)redius operation:(UINavigationControllerOperation)operation;


@end

NS_ASSUME_NONNULL_END

