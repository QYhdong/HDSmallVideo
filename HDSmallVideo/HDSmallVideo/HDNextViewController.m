//
//  HDNextViewController.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDNextViewController.h"

@interface HDNextViewController ()

@end

@implementation HDNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRectMake(100, 100, 100, 100))];
    label.text = @"手指侧滑返回";

    [self.view addSubview:label];
    
}


@end
