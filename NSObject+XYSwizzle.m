//
//  NSObject+XYSwizzle.m
//  tableView
//
//  Created by wuw on 2017/8/31.
//  Copyright © 2017年 Kingnet. All rights reserved.
//

#import "NSObject+XYSwizzle.h"
#import <objc/runtime.h>

#if OBJC_API_VERSION >= 2
#define GetClass(obj)	object_getClass(obj)
#else
#define GetClass(obj)	(obj ? obj->isa : Nil)
#endif

@implementation NSObject (XYSwizzle)

+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Class aClass = GetClass((id)self);
    NSLog(@"");
    
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}

@end
