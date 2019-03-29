//
//  main.m
//  15.runtime的使用-类
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "myPerson.h"
#import "myDog.h"

void  run(){
    printf("run----\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *p = [[myPerson alloc]init];
        [p eat];
        
        object_setClass(p,[myDog class]);//修改了isa指向
        [p eat]; //调用了myDog里面的run方法
        
        //object_isClass 判断一个OC对象是否为Class
        NSLog(@"%d %d %d",
                        object_isClass(p),
                        object_isClass([myPerson class]),
                        object_isClass(object_getClass([myPerson class]))
                        );

        
        NSLog(@"==========动态创建类=============");
        // 创建类
        Class newClass = objc_allocateClassPair([NSObject class], "myCat", 0);
        class_addIvar(newClass, "_age", 4, 1, @encode(int));
        class_addIvar(newClass, "_weight", 4, 1, @encode(int));
        class_addMethod(newClass, @selector(run), (IMP)run, "v@:");
        // 注册类
        objc_registerClassPair(newClass);
        id cat = [[newClass alloc] init];
        [cat setValue:@10 forKey:@"_age"];
        [cat setValue:@20 forKey:@"_weight"];
        [cat run];

        NSLog(@"%@ %@", [cat valueForKey:@"_age"], [cat valueForKey:@"_weight"]);

        // 在不需要这个类时释放
        objc_disposeClassPair(newClass);
        
    }
    return 0;
}

