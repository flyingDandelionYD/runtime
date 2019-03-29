//
//  myPerosn3.m
//  09.动态添加方法
//


#import "myPerosn3.h"
#import <objc/runtime.h>

@implementation myPerosn3
void c_other(id self, SEL _cmd){
    NSLog(@"c_other - %@ - %@", self, NSStringFromSelector(_cmd));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(test)) {
        // 动态添加test方法的实现
        class_addMethod(self, sel, (IMP)c_other, "v16@0:8");
        //v:f返回值是void  2个指针16个字节   第一个指针id 类型@ 从0 开始，  第二个 是SEL为 :  从第8个字节开始
        
        // 返回YES代表有动态添加方法
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
@end
