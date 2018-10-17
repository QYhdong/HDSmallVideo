//
//  OneFourthBallView.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/10/16.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "OneFourthBallView.h"
#import "UIView+FloatFrame.h"

@interface OneFourthBallView()

//显示文字
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIImageView *imageView;

//四分之一圆模糊板
@property (nonatomic,strong) UIToolbar *toolbar;

@end

@implementation OneFourthBallView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    _toolbar = [UIToolbar new];
    _toolbar.barStyle = UIBarStyleBlack;
    [self addSubview: _toolbar];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FloatBallResource.bundle/demo_cancel_float_default"]];
    _imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:_imageView];
    _label = [UILabel new];
    _label.font = [UIFont systemFontOfSize:10];
    _label.textColor = [UIColor colorWithHue:0 saturation:0 brightness:0.9 alpha:1.0];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"浮窗";
    [self addSubview:_label];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _toolbar.frame = self.bounds;
    _imageView.size = CGSizeMake(40, 40);
    _imageView.centerX = self.width / 2.0 + 26;
    _imageView.centerY = self.height / 2.0;
    _label.size = CGSizeMake(self.width, 20);
    _label.centerX = _imageView.centerX;
    _label.y = CGRectGetMaxY(_imageView.frame) + 14;
}

//是否正在显示
-(void)isShowingOneFourthView:(BOOL)showing{
    
    
}

@end
