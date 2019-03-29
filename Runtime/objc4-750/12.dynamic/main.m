//
//  main.m
//  12.dynamic
//


#import <Foundation/Foundation.h>
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *p = [[myPerson alloc]init];
        p.age = 100;
        NSLog(@"age = %d",p.age);
    }
    return 0;
}
