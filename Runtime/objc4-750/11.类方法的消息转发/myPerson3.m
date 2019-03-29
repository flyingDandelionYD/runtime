//
//  myPerson3.m
//  11.类方法的消息转发
//


#import "myPerson3.h"
#import <objc/runtime.h>
#import "myAnimal.h"

@implementation myPerson3
+ (id)forwardingTargetForSelector:(SEL)aSelector{
        if (aSelector == @selector(test)) return [[myAnimal alloc] init];//(此时会调用myAnimal的-test方法)
        //（本质： objc_msgSend([[MJCat alloc] init], @selector(test))）
        return [super forwardingTargetForSelector:aSelector];
}
@end
