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
    btn.layer.borderColor = ([[UIColor orangeColor] CGColor]);
    btn.layer.borderWidth = 0.5;
    btn.layer.cornerRadius = 2;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"视频" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:btn];
 
    UILabel *lll = [[UILabel alloc]init];
    lll.frame = CGRectMake(100, 100, 36, 15);
    lll.textAlignment = UITextAlignmentCenter;
    lll.layer.borderColor = ([[UIColor orangeColor] CGColor]);
    lll.layer.borderWidth = 1;
    lll.layer.cornerRadius = 3;
    lll.layer.masksToBounds = YES;
    lll.font = [UIFont systemFontOfSize:15];
    lll.text = @"个人";
    lll.textColor = [UIColor orangeColor];
    [self.view addSubview:lll];
    
    
    UIButton *pushBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
}

-(void)pushBtnClick{
 
    
    
}


-(void)btnClick{
    
    HDVideoController * videoVc = [[HDVideoController alloc]init];
    
    UINavigationController *videoVcNav = [[UINavigationController alloc]initWithRootViewController:videoVc];
    
    [self presentViewController:videoVcNav animated:YES completion:nil];
    
}

@end
