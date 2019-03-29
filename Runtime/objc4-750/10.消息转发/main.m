//
//  main.m
//  10.消息转发
//


#import <Foundation/Foundation.h>
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       myPerson *p = [[myPerson alloc]init];
       NSLog(@"%d",[p test:10]);
    }
    return 0;
}
