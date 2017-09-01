//
//  UIViewController+XYTrack.m
//  tableView
//
//  Created by wuw on 2017/8/31.
//  Copyright © 2017年 Kingnet. All rights reserved.
//

#import "UIViewController+XYTrack.h"
#import "NSObject+XYSwizzle.h"

@implementation UIViewController (XYTrack)

+ (void)load{
    [super load];
    
    [[self class] swizzlingInClass:[self class] originalSelector:@selector(viewDidLoad) swizzledSelector:@selector(xyt_viewDidLoad)];
    
}

- (void)xyt_viewDidLoad{
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
        NSLog(@"统计打点 : %@", self.class);
    }
    
    [self xyt_viewDidLoad];
}

@end
