//
//  UIButton+CCBlock.h
//  CustomCamera
//
//  Created by zhouke on 16/8/31.
//  Copyright © 2016年 zhongkefuchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CCBlock)

- (void)responseEvents:(UIControlEvents)events withActionBlock:(void(^)(id sender))block;

@end
