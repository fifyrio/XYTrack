//
//  UIControl+XYTrack.m
//  tableView
//
//  Created by wuw on 2017/8/31.
//  Copyright © 2017年 Kingnet. All rights reserved.
//

#import "UIControl+XYTrack.h"
#import "NSObject+XYSwizzle.h"

@implementation UIControl (XYTrack)

+ (void)load{
    [super load];
    
    [[self class] swizzlingInClass:[self class] originalSelector:@selector(sendAction:to:forEvent:) swizzledSelector:@selector(xyt_sendAction:to:forEvent:)];
}

- (void)xyt_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    NSLog(@"统计打点 :%s", __func__);
    // TODO: 可植入打点代码，进行无痕打点
}

@end
