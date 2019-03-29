//
//  myPerson2.m
//  09.动态添加方法
//


#import "myPerson2.h"
#import <objc/runtime.h>

@implementation myPerson2
- (void)other{
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(test)) {
        // 获取其他方法
            Method method = class_getInstanceMethod(self, @selector(other));
        
            // 动态添加test方法的实现
            class_addMethod(self, sel,
                            method_getImplementation(method),
                            method_getTypeEncoding(method));
            // 返回YES代表有动态添加方法
            return YES;
        }
    return [super resolveInstanceMethod:sel];
}


@end
