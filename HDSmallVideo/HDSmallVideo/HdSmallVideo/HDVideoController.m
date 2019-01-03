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

/*
 1.金考网校项目中题库板块中 完成首页界面适配工作, 进行顶部分类接口封装调试,首页数据接口对应调试及数据填充
 2.金考网校项目中题库板块首页的接口调试、调试成功后封装填充数据，完成顶部类型选项的选中效果，完成切换题库按钮跳转功能
 3.金考网校项目中题库板块的课程分类界面重写布局,改变选择方式为选中后直接跳转刷新界面,调整首页顶部的选中状态的底部蓝色显示条,上方总答题,正确率和练习处添加跳转到数据报告界面操作
 4.金考网校项目中题库板块按照原型需求开始"数据报告”界面的新UI布局搭建,完成整体界面布局工作
 5.金考网校项目中题库板块的开通状态逻辑处理,在课程分类界面中根据班的是否开通状态动态显示开通状态标识, 首页根据课程的开通状态, 进行动态的重新布局,实现未开通时的锁定状态UI布局,并禁用锁定的操作
 6.金考网校项目中我的板块昵称处添加点击方法可跳转到编辑界面,控制编辑界面输入文字过长时的显示效果; 题库板块中添加未登录情况下的点击逻辑,章节练习界面中进行整体布局调整
 7.金考网校项目中题库板块进行答案报告界面整体样式布局重写,实现进入当前界面时的顶部导航栏和状态栏变化,解决退出界面时的色值遗留到别的界面bug
 8.金考网校项目中题库板块答案报告界面的布局样式重写工作, 完成分两种场景(交卷后和查看昨天记录)进入后的数据填充方式,适配iphoneSE手机尺寸下布局超出问题
 9.金考网校项目中题库板块,解决数据报告界面完成分两种场景(交卷后和查看昨天记录)进入后的数据模型不一致导致的部分数据为null问题, 解决解析数据报告接口请求不到字段问题, 开始做题界面添加案例题拖拽功能
 10.金考网校项目题库板块中的做题板块调整,进行做题界面添加案例题拖拽功能,实现基本的图框拖拽,仍存在多手势冲突问题,实现当前为未开通界面时的提示购买功能并跳转到指定分类下
 11.金考网校项目中题库板块案例题的题干选择分离效果调整, 分多种情况下的模块复用判断逻辑, 调整错题集和查看答案两个界面中的显示效果,当查看错题集和查看答案界面时显示查看答案正常界面,优化首页右侧切换按钮效果,使其有阴影效果
 12.金考网校项目中题库板块答题报告和数据报告界面添加分享功能,优化首页分类文字过长时显示效果，iPhonex适配，调整文案文字，依照原型完成改版功能开发。
 13.测试金考网校项目并调整细节,题库中添加总答题 正确率 练习次数三处的按钮点击跳转到数据报告界面点击事件,修改首页切换按钮样式,只有左侧阴影效果 调整选择课程标题, 调整苹果审核期间的题库首页点击样式, 研究今天提出金考易计算器bug
 14.金考易计算器债券计算器逻辑熟悉，熟悉其复杂计算公式及相应符号标示，查看相关代码封装，排查计算有误的bug
 15.金考易计算器中进行货币时间价值计算器和现金流计算器的ipad界面布局适配
 16.
 
 */



#import "HDVideoController.h"
#import "HDVideoConfig.h"

@interface HDVideoController ()

@end

@implementation HDVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    
//    //录制按钮
//    UIButton *startShootBtn = [[UIButton alloc]initWithFrame:(CGRectMake(100, 100, 60, 60))];
//    [startShootBtn setTitle:@"开始拍摄" forState:(UIControlStateNormal)];
//    [startShootBtn addTarget:self action:@selector(startVideo) forControlEvents:(UIControlEventTouchUpInside)];
//
//    [self.view addSubview:startShootBtn];
    
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    _showVideoView = [[HDVideoView alloc]initWithType:(TypeFull)];
    [self.view addSubview:_showVideoView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//99392.467- 1987.7301
@end
// 10/0.823 - X/10000 = 0.2/0.815

