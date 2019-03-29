//
//  main.m
//  18.runtime的使用--交换IMP
//


#import <Foundation/Foundation.h>
#import "myPerson.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *p = [[myPerson  alloc]init];
        Method runMethod = class_getInstanceMethod([myPerson class], @selector(run));
        Method walkMethod = class_getInstanceMethod([myPerson class], @selector(walk));
        method_exchangeImplementations(runMethod, walkMethod);
        [p run];
        
        //替换方法
        class_replaceMethod([myPerson class], @selector(walk), imp_implementationWithBlock(^{
            NSLog(@"block实现方法的实现啦");
        }), "v@:");
        
        [p walk];
    }
    return 0;
}
