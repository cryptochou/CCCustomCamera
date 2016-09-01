//
//  CCRootViewController.m
//  CustomCamera
//
//  Created by zhouke on 16/8/23.
//  Copyright © 2016年 zhongkefuchuang. All rights reserved.
//

#import "CCRootViewController.h"
#import "UIButton+CCBlock.h"
#import "CCCameraViewController.h"

@interface CCRootViewController ()

@end

@implementation CCRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.center = self.view.center;
    [btn setTitle:@"拍照" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn responseEvents:UIControlEventTouchUpInside withActionBlock:^(id sender) {
        CCCameraViewController *camera = [[CCCameraViewController alloc] init];
        [self presentViewController:camera animated:YES completion:nil];
    }];
    [self.view addSubview:btn];
    
}

@end
