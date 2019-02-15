//
//  BannerV.m
//  iOS_Banner
//
//  Created by TYQ on 2018/5/2.
//  Copyright © 2018年 TYQ. All rights reserved.
//
#import "BannerV.h"
@interface BannerV()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView  *bannerScrollV;
@property(nonatomic,strong)UIPageControl *bannerPageControl;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation BannerV

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.width = frame.size.width;
        self.height = frame.size.height;
        [self createUI];
    }
    return self;
}
-(void)createUI{
    self.bannerScrollV = [[UIScrollView alloc]init];
    self.bannerScrollV.delegate = self;
    //设置分页效果
    self.bannerScrollV.pagingEnabled = YES;
    //水平滚动y条隐藏
    self.bannerScrollV.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.bannerScrollV];
    self.bannerPageControl = [[UIPageControl alloc]init];
    if (self.pageColor) {
        self.bannerPageControl.pageIndicatorTintColor = self.pageColor;
    }
    if (self.currentPageColor) {
        self.bannerPageControl.currentPageIndicatorTintColor =self.currentPageColor;
    }
    [self addSubview:self.bannerPageControl];
}
-(void)chanePage{
        //通过改变contentOffset来切换滚动视图的子界面
        float offset_X = self.bannerScrollV.contentOffset.x;
        //每次切换一个屏幕
        offset_X += self.width;
        //说明要从最右边的多余视图开始滚动了，最右边的多余视图实际上就是第一个视图。所以偏移量需要更改为第一个视图的偏移量。
        if (offset_X > self.width*3) {
            self.bannerScrollV.contentOffset = CGPointMake(0, 0);
        }
        //说明正在显示的就是最右边的多余视图，最右边的多余视图实际上就是第一个视图。所以pageControl的小白点需要在第一个视图的位置。
        if (offset_X == self.width*3) {
            self.bannerPageControl.currentPage = 0;
        }else{
            self.bannerPageControl.currentPage = offset_X/self.width;
        }
        //得到最终的偏移量
        CGPoint resultPoint = CGPointMake(offset_X, 0);
        //切换视图时带动画效果
        //最右边的多余视图实际上就是第一个视图，现在是要从第一个视图向第二个视图偏移，所以偏移量为一个屏幕宽度
        if (offset_X >self.width*3) {
            self.bannerPageControl.currentPage = 1;
            [self.bannerScrollV setContentOffset:CGPointMake(self.width, 0) animated:YES];
        }else{
            [self.bannerScrollV setContentOffset:resultPoint animated:YES];
        }
}
-(void)setNeedsLayout{
    [super setNeedsLayout];
    self.bannerScrollV.frame = CGRectMake(0, 0, self.width, self.height);
    self.bannerScrollV.contentSize =CGSizeMake(self.imgArr.count * self.width, self.height);
    for (int i=0; i<self.imgArr.count; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.width, 0, self.width, self.height)];
        imageV.image = [UIImage imageNamed:self.imgArr[i]];
        [self.bannerScrollV addSubview:imageV];
  }
    //额外加一个试图
    UIImageView *lastImageV = [[UIImageView alloc]initWithFrame:CGRectMake(self.imgArr.count*self.width, 0, self.width, self.height)];
    lastImageV.image = [UIImage imageNamed:self.imgArr[0]];
    [self.bannerScrollV addSubview:lastImageV];
    //pageControl的位置设置
    self.bannerPageControl.frame = CGRectMake(0, self.height-30, self.width, 20);
    self.bannerPageControl.currentPage = 0;
    self.bannerPageControl.numberOfPages = self.imgArr.count;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(chanePage) userInfo:nil repeats:YES];
}
#pragma mark -- 滚动视图的代理方法
//开始拖拽的代理方法，在此方法中暂停定时器。
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"正在拖拽视图，所以需要将自动播放暂停掉");
    //setFireDate：设置定时器在什么时间启动
    //[NSDate distantFuture]:将来的某一时刻
    [self.timer setFireDate:[NSDate distantFuture]];
}
//视图静止时（没有人在拖拽），开启定时器，让自动轮播
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //视图静止之后，过1.5秒在开启定时器
    //[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]  返回值为从现在时刻开始 再过1.5秒的时刻。
    NSLog(@"开启定时器");
    [self.timer setFireDate:[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]];
}
@end
