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
#import "HDVideoConfig.h"

@interface HDVideoController ()

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

-(void)startVideo{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
