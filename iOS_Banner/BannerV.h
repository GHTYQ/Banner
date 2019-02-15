//
//  BannerV.h
//  iOS_Banner
//
//  Created by TYQ on 2018/5/2.
//  Copyright © 2018年 TYQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerV : UIView
//property是NSString或者NSArray及其子类的时候，最好选择使用copy属性修饰。防止赋值为可变数据的时候发生变化
@property(nonatomic,copy)NSArray *imgArr;
@property(nonatomic,strong)UIColor *pageColor;
@property(nonatomic,strong)UIColor *currentPageColor;
@end
