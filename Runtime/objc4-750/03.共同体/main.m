//
//  main.m
//  03.共同体
//


#import <Foundation/Foundation.h>
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *person = [[myPerson alloc] init];
        person.rich = YES;
        person.tall = NO;
        person.handsome = YES;
        NSLog(@"tall:%d rich:%d hansome:%d", person.isTall, person.isRich, person.isHandsome);
    }
    return 0;
}
