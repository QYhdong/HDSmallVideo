//
//  HDVideoController.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/4/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//
//
/*

 
 
*/

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "HDVideoView.h"

@interface HDVideoController : UIViewController

-(void)startVideo;
@property (nonatomic,strong) HDVideoView *showVideoView;

@end
