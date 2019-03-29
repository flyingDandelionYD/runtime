//
//  main.m
//  14.消息转发应用
//


#import <Foundation/Foundation.h>
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *p = [[myPerson alloc]init];
        [p run];
        [p test];
        [p other];
    }
    return 0;
}
