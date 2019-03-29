//
//  main.m
//  07.objc_msgSend执行流程
//


#import <Foundation/Foundation.h>
#import "myPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *person = [[myPerson alloc]init];
        
        //类方法
        [myPerson walk];
        ((void(*)(id,SEL))objc_msgSend)([myPerson class], @selector(walk));
        
        //实例方法
        //没有返回值，没有参数
        [person run];
        ((void(*)(id,SEL))objc_msgSend)(person, @selector(run));
        
        //没有返回值 ，有一个参数
        [person sayHello:@"Jack"];
        ((void(*)(id,SEL,NSString*))objc_msgSend)(person, @selector(sayHello:),@"Lucy");
        
        //有返回值，有一个参数
        [person  sayGoodBye:@"LaLa"];
        NSString *name =  ((NSString*(*)(id,SEL,NSString*))objc_msgSend)(person, @selector(sayGoodBye:),@"Kitty");
        NSLog(@"%@",name);
    }
    return 0;
}

