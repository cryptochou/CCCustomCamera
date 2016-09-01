//
//  CCPhotoViewController.m
//  CustomCamera
//
//  Created by zhouke on 16/9/1.
//  Copyright © 2016年 zhongkefuchuang. All rights reserved.
//

#import "CCPhotoViewController.h"

@interface CCPhotoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CCPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.image = self.image;
}
- (IBAction)closeClick:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
