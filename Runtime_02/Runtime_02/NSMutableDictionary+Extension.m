//
//  NSMutableDictionary+Extension.m
//  Runtime_02
//


#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Extension)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        
        unsigned int count;
        Method *methodList = class_copyMethodList(cls, &count);
        for (unsigned int i = 0; i < count; i++) {
            Method method = methodList[i];
            NSString *methodName = NSStringFromSelector(method_getName(method));
            NSLog(@"方法名：%d----%@",i,methodName);
        }
        free(methodList);
        
        
        Method method1 = class_getInstanceMethod(cls, @selector(setObject:forKey:));
        Method method2 = class_getInstanceMethod(cls, @selector(my_setObject:forKey:));
        method_exchangeImplementations(method1, method2);
        
        Class cls2 = NSClassFromString(@"__NSDictionaryI");
        Method method3 = class_getInstanceMethod(cls2, @selector(objectForKeyedSubscript:));
        Method method4 = class_getInstanceMethod(cls2, @selector(my_objectForKeyedSubscript:));
        method_exchangeImplementations(method3, method4);
    });
}

- (void)my_setObject:(id)obj forKey:(id<NSCopying>)key{
    if (!obj) return;
    if (!key) return;
    [self my_setObject:obj forKey:key];
}


- (id)my_objectForKeyedSubscript:(id)key{//dict[nil]
    if (!key) return nil;
    return [self my_objectForKeyedSubscript:key];
}


@end
