//
//  main.m
//  01.取值设值
//


#import <Foundation/Foundation.h>
#import "myPerson.h"

//需求：将对象里面的tall，rich，handsome放在一个字节里面（char）
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
