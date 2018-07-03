//
//  HDVideoController.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/4/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

/*
 AVCaptureSession是AVFoundation的核心类,用于捕捉视频和音频,协调视频和音频的输入和输出流.
 */




#import "HDVideoController.h"

@interface HDVideoController ()

@property (nonatomic,strong)  AVCaptureSession *session;                   //捕捉会话
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;      //视频输入源
@property (nonatomic,strong) AVCaptureDeviceInput *audioInput;       //音频输入源
@property (nonatomic,strong) AVCaptureMovieFileOutput *fileOutPut;  //输出源
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *previewLayer;  //预览图层

@end

@implementation HDVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    //录制按钮
    UIButton *startShootBtn = [[UIButton alloc]initWithFrame:(CGRectMake(100, 100, 60, 60))];
    [startShootBtn setTitle:@"开始拍摄" forState:(UIControlStateNormal)];
    [startShootBtn addTarget:self action:@selector(startVideo) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:startShootBtn];
    
    
}

//开始录制视频
- (void)startVideo{
    
//    UIWindow *keyWindow = [UIApplication sharedApplication].delegate.window;
//    [keyWindow addSubview:self.view];
    //
    _session = [[AVCaptureSession alloc]init];
    if ([_session canSetSessionPreset:AVCaptureSessionPreset640x480]){
        [_session setSessionPreset:AVCaptureSessionPreset640x480];
    }
    
    [self startInputVideo];
    [self startInputAudio];
    [self setupFileOut];
    [self setUpPreviewLayerWithType:TypeOne];
    
    [_session startRunning];
}

//懒加载
-(AVCaptureVideoPreviewLayer *)previewLayer{
    if (!_previewLayer){
        _previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return _previewLayer;
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
    [self.view.layer insertSublayer:_previewLayer atIndex:0];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
