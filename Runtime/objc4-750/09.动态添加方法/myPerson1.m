//
//  myPerson1.m
//  09.动态添加方法
//


#import "myPerson1.h"
#import <objc/runtime.h>

struct method_t {
    SEL sel;
    char *types;
    IMP imp;
};

@implementation myPerson1
+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(test)) {
        // 获取其他方法
        struct method_t *method = (struct method_t *)class_getInstanceMethod(self, @selector(other));
        
        // 动态添加test方法的实现
        class_addMethod(self, sel, method->imp, method->types);
        
        
        // 返回YES代表有动态添加方法
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (void)other{
    NSLog(@"%s", __func__);
}
@end
