//
//  HDVideoController.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/4/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

typedef NS_ENUM(NSInteger,HDVideoType){
    TypeOne = 0,
    TypeTwo,
    TypeFull
};

@interface HDVideoController : UIViewController

-(void)startVideo;

@end
