//
//  HDVideoView.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/7/5.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDVideoConfig.h"

@interface HDVideoView : UIView

@property (nonatomic,strong) HDVideoConfig *videoConfig;            //配置
-(instancetype)initWithType:(HDVideoType)screenType;                    //根据类型初始化


@end
