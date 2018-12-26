//
//  ViewController.m
//  HDSmallVideo
//
//  Created by ddd on 17/8/7.
//  Copyright © 2017年 HuangDong. All rights reserved.
//

#import "ViewController.h"
#import "HDVideoController.h"
#import "HDNextViewController.h"

@interface ViewController ()


@property(nonatomic,assign) int leftTicketCount;//剩余票数

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
    [pushBtn setTitle:@"跳转界面" forState:(UIControlStateNormal)];
    [pushBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    pushBtn.frame = CGRectMake(0, 0, 100, 50);
    pushBtn.center = self.view.center;
    [self.view addSubview:pushBtn];
    
    _leftTicketCount = 60;
    
//    }
//    dispatch_queue_t queue8 = dispatch_queue_create("dongHuang", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue8, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"BBB%@",[NSThread currentThread]);
//
//    });
//
//    dispatch_queue_t queue7 = dispatch_queue_create("dongHuang", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue7, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"CCC%@",[NSThread currentThread]);
//
//    });
//
//    dispatch_queue_t queue6 = dispatch_queue_create("dongHuang", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue6, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"DDD%@",[NSThread currentThread]);
//
//    });
//
//    dispatch_queue_t queue5 = dispatch_queue_create("dongHuang", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue5, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"EEE%@",[NSThread currentThread]);
//
//    });
//
//    dispatch_queue_t queue4 = dispatch_queue_create("dongHuang", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue4, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"FFF%@",[NSThread currentThread]);
//
//    });
    
    
//    dispatch_queue_t queueee = dispatch_queue_create("dongHuanggg", DISPATCH_QUEUE_CONCURRENT);
//        for (int i = 0; i<1000; i++){
//            dispatch_async(queueee, ^{
//                NSLog(@"BBBB哈哈哈哈--%d",i);
//                NSLog(@"BBBB%@",[NSThread currentThread]);
//            });
//    }

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

    dispatch_queue_t queue = dispatch_queue_create("com.dongHuang", DISPATCH_QUEUE_CONCURRENT);
    
    

    dispatch_async(queue, ^{
//        [NSThread sleepForTimeInterval:1];
        NSLog(@"AAA%@",[NSThread currentThread]);
        [self performSelector:@selector(aaaaa) withObject:nil afterDelay:3];
        [self saleTickets];
    });
      [NSThread sleepForTimeInterval:10];

    dispatch_async(queue, ^{
        NSLog(@"BBB%@",[NSThread currentThread]);
        [self saleTickets];
    });
    
NSLog(@"aaaaaaaaaaa");

}

-(void)aaaaa{
    NSLog(@"aaaaaaaaaaa");
    NSLog(@"%@",[NSThread currentThread]);
}

// 卖票
-(void)saleTickets
{
    while(true)
    {
        //模拟延时，卖出一张票后，让卖票的线程休眠1秒
        [NSThread sleepForTimeInterval:1.0];
        //判断是否有票
        @synchronized(self)
        {
            if(self.leftTicketCount>0)
            {
                //如果有卖一张
                self.leftTicketCount--;
                //提示余额
                NSLog(@"%@卖了一张票，剩余%d张票",[NSThread currentThread].name,self.leftTicketCount);
                
            }
            else
            {
                //如果没有，提示用户
                NSLog(@"没有余票");
                return;
            }
        }
    }
}


-(void)pushBtnClick{
 
    [self.navigationController pushViewController:[HDNextViewController new] animated:YES];
    
}


-(void)btnClick{
    
    HDVideoController * videoVc = [[HDVideoController alloc]init];
    
    UINavigationController *videoVcNav = [[UINavigationController alloc]initWithRootViewController:videoVc];
    
    [self presentViewController:videoVcNav animated:YES completion:nil];
    
}

@end
