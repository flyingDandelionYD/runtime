//
//  myPerson2.m
//  11.类方法的消息转发
//


#import "myPerson2.h"

@implementation myPerson2
+ (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) return  nil; //执行下面的methodSignatureForSelector方法
    return [super forwardingTargetForSelector:aSelector];
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    return [super methodSignatureForSelector:aSelector];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"1123");
}
@end
