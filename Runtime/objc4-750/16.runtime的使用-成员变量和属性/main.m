//
//  main.m
//  16.runtime的使用-成员变量和属性
//
my_
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 获取成员变量信息 和 设置
        Ivar ageIvar = class_getInstanceVariable([myPerson class], "_age");
        Ivar nameIvar = class_getInstanceVariable([myPerson class], "_name");
        Ivar heightIvar = class_getInstanceVariable([myPerson class], "_height");
        
        NSLog(@"%s %s", ivar_getName(ageIvar), ivar_getTypeEncoding(ageIvar));
        NSLog(@"%s %s", ivar_getName(nameIvar), ivar_getTypeEncoding(nameIvar));
        NSLog(@"%s %s", ivar_getName(heightIvar), ivar_getTypeEncoding(heightIvar));
        
        myPerson *p = [[myPerson alloc] init];
        
        /*
        object_setIvar(p, nameIvar, @"123");
        object_setIvar(p, ageIvar, (__bridge id)(void *)10);
        object_setIvar(p, heightIvar,(__bridge id)(void *)180);
         */
        //坑 object_getIvar 不支持非对象 https://www.jianshu.com/p/e498142f788d
       
       //解决：
        object_setIvar(p, nameIvar, @"123");
        object_setIvar(p, ageIvar, @(10));
        object_setIvar(p, heightIvar,@(180));
        NSLog(@"name = %@", object_getIvar(p, nameIvar));
        NSLog(@"age = %@", object_getIvar(p, ageIvar));
        NSLog(@"height = %@", object_getIvar(p, heightIvar));
       
        NSLog(@"====成员变量的数量====");
        // 成员变量的数量
        unsigned int count;
        Ivar *ivars = class_copyIvarList([myPerson class], &count);
        for (unsigned int i = 0; i<count; i++) {
            // 取出i位置的成员变量
            Ivar ivar = ivars[i];
            NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        }
        free(ivars);
    }
    return 0;
}
