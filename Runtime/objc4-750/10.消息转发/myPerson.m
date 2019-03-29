//
//  myPerson.m
//  10.消息转发
//


#import "myPerson.h"
#import <objc/runtime.h>
#import "myAnimal.h"

@implementation myPerson
- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"%s",__FUNCTION__);
    if (aSelector == @selector(test:)) {
       
        return nil;
        
        // objc_msgSend([[myAnimal alloc] init], aSelector)
//        return [[myAnimal alloc] init];//如果 不为nil，则直接不走下面的了，会直接objc_msgSend
       
    }
    return [super forwardingTargetForSelector:aSelector];
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    NSLog(@"%s",__FUNCTION__);
    if (aSelector == @selector(test:)) {
//        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
        return [[[myAnimal alloc] init] methodSignatureForSelector:aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
     NSLog(@"%s",__FUNCTION__);
    // 参数顺序：receiver、selector、other arguments
    //    int age;
    //    [anInvocation getArgument:&age atIndex:2];
    //    NSLog(@"%d", age + 10);
    
    
    // anInvocation.target == [[myAnimal alloc] init]; //方法调用者
    // anInvocation.selector == test; //方法名
    // anInvocation的参数：15
    // [[[myAnimal alloc] init] test:15];

    [anInvocation invokeWithTarget:[[myAnimal alloc] init]];
    int ret;
    [anInvocation getReturnValue:&ret];

    NSLog(@"----%d", ret);
}
@end
