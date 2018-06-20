//
//  HDVideoController.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/4/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDVideoController.h"

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

//开始录制视频
- (void)startVideo{
    
//    UIWindow *keyWindow = [UIApplication sharedApplication].delegate.window;
//    [keyWindow addSubview:self.view];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
