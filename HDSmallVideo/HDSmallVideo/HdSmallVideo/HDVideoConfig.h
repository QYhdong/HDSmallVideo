//
//  HDVideoConfig.h
//  HDSmallVideo
//
//  Created by HJddd on 2018/7/3.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kScreenSize [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//屏幕大小的状态
typedef NS_ENUM(NSInteger,HDVideoType){
    TypeOne = 0,
    TypeTwo,
    TypeFull
};

//录制状态
typedef NS_ENUM(NSInteger,HDRecordState){
    HDRecordStateInit = 0,
    HDRecordStatePause,
    HDRecordStateDoing,
    HDRecordStateFinish
};

@protocol HDVideoConfigDelegate <NSObject>

-(void)RecordState:(HDRecordState)recordState;

@end

@interface HDVideoConfig : NSObject

@property (nonatomic,assign) HDRecordState *recordState;        //录制状态

-(instancetype)initVideoViewWithType:(HDVideoType)type andSuperView:(UIView *)superView;                           //初始化

@end
