//
//  NSObject+XYSwizzle.h
//  tableView
//
//  Created by wuw on 2017/8/31.
//  Copyright © 2017年 Kingnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XYSwizzle)

+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end
