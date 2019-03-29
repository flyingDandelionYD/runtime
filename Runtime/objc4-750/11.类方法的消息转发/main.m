//
//  main.m
//  11.类方法的消息转发
//


#import <Foundation/Foundation.h>
#import "myPerson1.h"
#import "myPerson2.h"
#import "myPerson3.h"

// 元类对象是一种特殊的类对象
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [myPerson1 test];
        [myPerson2 test];
        [myPerson3 test];
    }
    return 0;
}
