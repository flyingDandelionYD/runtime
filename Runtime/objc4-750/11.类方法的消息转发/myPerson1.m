//
//  myPerson1.m
//  11.类方法的消息转发
//


#import "myPerson1.h"
#import <objc/runtime.h>
#import "myAnimal.h"

@implementation myPerson1
+ (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) return [myAnimal class];
    return [super forwardingTargetForSelector:aSelector];
}
@end
