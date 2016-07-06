//
//  ViewController.m
//  circleAnimation
//
//  Created by comsubin on 16/7/5.
//  Copyright © 2016年 comsubin. All rights reserved.
//

#import "ViewController.h"
#define ScreenWidth self.view.bounds.size.width // viewController 大小 宽度
#define ScreenHeight self.view.bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.progressIndicatorView = [[circularLoaderView alloc]initWithFrame:CGRectZero];
    
    self.customImage = [[CustomImageView alloc]initWithFrame:CGRectMake(0,(ScreenHeight-200)/2, ScreenWidth, 240)];
//    self.customImage.center = self.view.center;
    [self.view addSubview:self.customImage];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
