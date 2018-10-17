//
//  OneFourthBallView.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneFourthBallView : UIView

//悬浮球是否正在显示
-(void)isShowingOneFourthView:(BOOL)showing;

//悬浮球是否进入右下角视图
- (void)moveWithTouchInRound:(BOOL)touchInRound;

/** 右滑手势拖动改变显示百分比 */
- (void)showCancelFloatViewWithProress:(CGFloat)progress completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
