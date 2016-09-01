//
//  UIButton+CCBlock.m
//  CustomCamera
//
//  Created by zhouke on 16/8/31.
//  Copyright © 2016年 zhongkefuchuang. All rights reserved.
//

#import "UIButton+CCBlock.h"
#import <objc/runtime.h>

static const char targetsKey;

@interface CCTatget : NSObject

@property (nonatomic, copy) void(^targetBlock)(id sender);

@end

@implementation CCTatget

- (instancetype)initWithBlock:(void(^)(id sender))block
{
    if (self = [super init]) {
        self.targetBlock = [block copy];
    }
    return self;
}
- (void)buttonAction:(id)sender
{
    if (self.targetBlock) {
        self.targetBlock(sender);
    }
}
- (void)dealloc
{
    NSLog(@"target dealloc");
}

@end

@implementation UIButton (CCBlock)
- (void)responseEvents:(UIControlEvents)events withActionBlock:(void(^)(id sender))block
{
    if (block) {
        CCTatget *target = [[CCTatget alloc] initWithBlock:block];
        NSMutableArray *targets = [self allBlockTargets];
        [targets addObject:target];
        [self addTarget:target action:@selector(buttonAction:) forControlEvents:events];
    }
}

- (NSMutableArray *)allBlockTargets
{
    NSMutableArray *targets = objc_getAssociatedObject(self, &targetsKey);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &targetsKey, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
