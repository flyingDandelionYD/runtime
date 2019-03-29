//
//  UIControl+Extension.m
//  Runtime_02
//


#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)
+ (void)load{
    // hook：钩子函数
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(my_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)my_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    
    // 调用系统原来的实现
    [self my_sendAction:action to:target forEvent:event];
    
    //    if ([self isKindOfClass:[UIButton class]]) {
    //        // 拦截了所有按钮的事件
    //
    //    }
}
@end
