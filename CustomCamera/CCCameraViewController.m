//
//  CCCameraViewController.m
//  CustomCamera
//
//  Created by zhouke on 16/8/31.
//  Copyright © 2016年 zhongkefuchuang. All rights reserved.
//

#import "CCCameraViewController.h"
#import "CCCameraManger.h"
#import "CCPhotoViewController.h"

@interface CCCameraViewController ()

@property (weak, nonatomic) IBOutlet UIView *preview;
@property (weak, nonatomic) IBOutlet UIButton *transformBtn;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoBtn;
@property (weak, nonatomic) IBOutlet UIButton *lightSwitchBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@property (nonatomic, strong) CCCameraManger *manger;

@end

@implementation CCCameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.manger startUp];
}

- (IBAction)closeClick:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)transformAction:(UIButton *)sender
{
    self.transformBtn.selected = !self.transformBtn.selected;
    [self.manger changeCameraInputDeviceisFront:sender.selected];
    if (self.transformBtn.selected == YES) { // 切换为前置镜头关闭闪光灯
        self.lightSwitchBtn.selected = NO;
        [self.manger closeFlashLight];
    }
}

- (IBAction)lightSwitchAcrion:(UIButton *)sender
{
    if (self.transformBtn.selected) { // 当前为前置镜头的时候不能打开闪光灯
        return;
    }
    self.lightSwitchBtn.selected = !self.lightSwitchBtn.selected;
    if (self.lightSwitchBtn.selected) {
        [self.manger openFlashLight];
    } else {
        [self.manger closeFlashLight];
    }
}

- (IBAction)takePhotoAction:(id)sender
{
    [self.manger takePhotoWithImageBlock:^(UIImage *originImage, UIImage *scaledImage, UIImage *croppedImage) {
        self.lightSwitchBtn.selected = NO; // 拍照完成后会自动关闭闪光灯
        
        CCPhotoViewController *photo = [[CCPhotoViewController alloc] init];
        photo.image = croppedImage;
        [self presentViewController:photo animated:YES completion:nil];
    }];
}

- (CCCameraManger *)manger
{
    if (!_manger) {
        _manger = [[CCCameraManger alloc] initWithParentView:self.preview];
        _manger.faceRecognition = YES;
    }
    return _manger;
}

@end
