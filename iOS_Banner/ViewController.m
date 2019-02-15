//
//  ViewController.m
//  iOS_Banner
//
//  Created by TYQ on 2018/5/2.
//  Copyright © 2018年 TYQ. All rights reserved.
//

#import "ViewController.h"
#import "BannerVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"开始显示");
//    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    imageV.backgroundColor = [UIColor redColor];
//    imageV.image = [UIImage imageNamed:@"test"];
//    [self.view addSubview:imageV];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BannerVC *bvc = [[BannerVC alloc]init];
    [self presentViewController:bvc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
