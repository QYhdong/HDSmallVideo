//
//  HdPlayerView.m
//  HDSmallVideo
//
//  Created by HJddd on 2018/12/26.
//  Copyright © 2018年 HuangDong. All rights reserved.
//

#import "HdPlayerView.h"
#import <AVFoundation/AVFoundation.h>

@interface HdPlayerView()

@property (nonatomic,strong) AVURLAsset *urlAsset;
@property (nonatomic,strong) AVPlayerItem *playerItem;
@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic, strong) NSURL                  *videoURL;
/** playerLayer */
@property (nonatomic, strong) AVPlayerLayer          *playerLayer;
/** 是否自动播放 */
@property (nonatomic, assign) BOOL                   isAutoPlay;

@end

@implementation HdPlayerView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self){
        [self configHdPlayer ];
    }
    
    return self;
}

//设置参数
-(void)configHdPlayer{
    
    self.urlAsset = [AVURLAsset assetWithURL:self.videoURL];
    self.playerItem = [AVPlayerItem playerItemWithAsset:self.urlAsset];
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.backgroundColor = [UIColor blackColor];
    //默认视频填充模式
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    //自动播放
    self.isAutoPlay = YES;
    
    
    
}


@end
