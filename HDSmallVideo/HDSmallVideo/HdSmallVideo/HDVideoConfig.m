//
//  HDVideoConfig.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/7/3.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDVideoConfig.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface HDVideoConfig ()

@property (nonatomic,weak) UIView *superView;                                       //父视图

@property (nonatomic,strong)  AVCaptureSession *session;                   //捕捉会话
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;      //视频输入源
@property (nonatomic,strong) AVCaptureDeviceInput *audioInput;       //音频输入源
@property (nonatomic,strong) AVCaptureMovieFileOutput *fileOutPut;  //输出源
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *previewLayer;  //预览图层

@end

@implementation HDVideoConfig


//开始录制视频
- (void)startVideo{

    [self startInputVideo];
    [self startInputAudio];
    [self setupFileOut];
    [self setUpPreviewLayerWithType:TypeOne];
    
    [_session startRunning];
}


//懒加载
-(AVCaptureSession *)session{
    if(!_session){
        _session = [[AVCaptureSession alloc]init];
        if ([_session canSetSessionPreset:AVCaptureSessionPreset640x480]){
            [_session setSessionPreset:AVCaptureSessionPreset640x480];
        }
    }
    return _session;
}

-(AVCaptureVideoPreviewLayer *)previewLayer{
    if (!_previewLayer){
        _previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return _previewLayer;
}



#pragma mark  方法列表

-(void)setRecordState:(HDRecordState *)recordState{
    if (_recordState != recordState){
        _recordState = recordState;
    }
}

-(void)enterBackground{
    
}
-(void)becomeActive{
    
}

//初始化
-(void)videoInit{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeActive) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    _recordState = HDRecordStateInit;
}

//视频输入
-(void)startInputVideo{
    //获取视频输入设备
    //后摄像头
    AVCaptureDevice *videoCaptureDevice = [self getCameraDeviceWithAVPosition:AVCaptureDevicePositionBack];
    
    //视频输入源
    NSError *error = nil;
    _videoInput = [[AVCaptureDeviceInput alloc]initWithDevice:videoCaptureDevice error:&error];
    
    //添加视频输入源到会话session中
    if ([_session canAddInput:_videoInput]){
        [_session addInput:_videoInput];
    }
    
}

//音频输入源
-(void)startInputAudio{
    //获取音频设备
    AVCaptureDevice *audioCatureDevice = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio] firstObject];
    
    NSError *error = nil;
    _audioInput = [[AVCaptureDeviceInput alloc]initWithDevice:audioCatureDevice error:&error];
    
    //添加到会话
    if ([_session canAddInput:_audioInput]){
        [_session addInput:_audioInput];
    }
}

//输出源设置
-(void)setupFileOut{
    //输出设备AVCaptureMovieFileOutput
    _fileOutPut = [[AVCaptureMovieFileOutput alloc]init];
    //输出对象属性
    AVCaptureConnection *captureConnection = [_fileOutPut connectionWithMediaType:AVMediaTypeVideo];
    //支持防抖设备上添加防抖
    if ([captureConnection isVideoStabilizationSupported]){
        captureConnection.preferredVideoStabilizationMode = AVCaptureVideoStabilizationModeAuto;    //自动防抖
    }
    //预览图层和屏幕方向一致
    //    captureConnection.videoOrientation = [self]
    
    //添加到会话
    if ([_session canAddOutput:_fileOutPut]){
        [_session addOutput:_fileOutPut];
    }

}

//设置预览图层
-(void)setUpPreviewLayerWithType:(HDVideoType)type{
    
    CGRect rect = CGRectZero;
    
    switch (type) {
        case TypeOne:
            rect = CGRectMake(0, 0, kScreenWidth, kScreenWidth);
            break;
        case TypeTwo:
            rect = CGRectMake(0, 0, kScreenWidth, kScreenHeight*4/3);
            break;
        case TypeFull:
            rect = [UIScreen mainScreen].bounds;
            break;
        default:
            rect = [UIScreen mainScreen].bounds;
            break;
    }
    
    self.previewLayer.frame = rect;
    [_superView.layer insertSublayer:_previewLayer atIndex:0];
}

//视频聚焦
-(void)videoFocus{
    //    [self.view addSubview:<#(nonnull UIView *)#>]
}

#pragma mark 获取摄像头
-(AVCaptureDevice *)getCameraDeviceWithAVPosition:(AVCaptureDevicePosition)position{
    NSArray *cameras = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for(AVCaptureDevice *camera in cameras){
        if ([camera position] == position){
            return camera;
        }
    }
    return nil;
}



@end
