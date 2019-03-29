//
//  main.m
//  09.动态添加方法
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "myPerson1.h"
#import "myPerson2.h"
#import "myPerosn3.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        myPerson1 *p1 = [[myPerson1 alloc]init];
//       [p1 test];
        
        ((void(*)(id,SEL))objc_msgSend)(p1, @selector(test));
         */
        
        /*
        myPerson2 *p2 = [[myPerson2 alloc]init];
        ((void(*)(id,SEL))objc_msgSend)(p2, @selector(test));
         */
        myPerosn3 *p3 = [[myPerosn3 alloc]init];
        ((void(*)(id,SEL))objc_msgSend)(p3, @selector(test));

    }
    return 0;
}
