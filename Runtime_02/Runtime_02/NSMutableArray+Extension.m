//
//  NSMutableArray+Extension.m
//  Runtime_02
//


#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
    Class cls = NSClassFromString(@"__NSArrayM");
        Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cls, @selector(my_insertObject:atIndex:));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)my_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject == nil) return;
    
    [self my_insertObject:anObject atIndex:index];
}
@end
