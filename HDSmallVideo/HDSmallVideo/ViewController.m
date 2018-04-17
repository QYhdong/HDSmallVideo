//
//  ViewController.m
//  HDSmallVideo
//
//  Created by ddd on 17/8/7.
//  Copyright © 2017年 HuangDong. All rights reserved.
//

#import "ViewController.h"
#import "HDVideoController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(20, 100, 50, 30);
    [btn setTitle:@"视频" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:btn];
    
}

-(void)btnClick{
    
    HDVideoController * videoVc = [[HDVideoController alloc]init];
    [videoVc startVideo];
    
}

@end
