//
//  HDVideoView.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/7/5.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HDVideoView.h"

@interface HDVideoView()

@property (nonatomic,strong) UIView*topChooseView;          //顶部选择框

@end

@implementation HDVideoView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithType:(HDVideoType)screenType{
    self = [super initWithFrame:kScreenSize];
    if (self){
        
//        self.backgroundColor = [UIColor whiteColor];
        
        _videoConfig = [[HDVideoConfig alloc]initVideoViewWithType:screenType andSuperView:self];
        
        
        
        [self setupUI];
    }
    return self;
}


//view UI布局
-(void)setupUI{
    
    _topChooseView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, kScreenWidth, 44))];
    [self addSubview:_topChooseView];
    
    
    
}


@end
