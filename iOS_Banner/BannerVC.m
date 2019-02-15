//
//  BannerVC.m
//  iOS_Banner
//
//  Created by TYQ on 2018/5/2.
//  Copyright © 2018年 TYQ. All rights reserved.
//

#import "BannerVC.h"
#import "BannerV.h"
@interface BannerVC ()

@end

@implementation BannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    BannerV *bv=[[BannerV alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    bv.backgroundColor = [UIColor yellowColor];
    bv.imgArr = @[@"test",@"one",@"two"];
    [self.view addSubview:bv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
