//
//  main.m
//  13.class和super
//


#import <Foundation/Foundation.h>
#import "myPerson.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *p = [[myPerson alloc]init];
        [p run];
        
        BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res3 = [[myPerson class] isKindOfClass:[myPerson class]];
        BOOL res4 = [[myPerson class] isMemberOfClass:[myPerson class]];
        BOOL res5 = [[myPerson class] isMemberOfClass:[NSObject class]];
        NSLog(@"res1=>%d,res2=>%d,res3=>%d,res4=>%d,res5=>%d",res1,res2,res3,res4,res5);
        
        NSLog(@"===================");
        NSLog(@"%d", [NSObject isKindOfClass:[NSObject class]]); // 1  //NSObject的元类的superclass是指向类对象的
        
        NSLog(@"%d", [NSObject isMemberOfClass:[NSObject class]]); // 0 左边是元类对象（类对象的类对象），而右边是类对象
        NSLog(@"%d", [myPerson isKindOfClass:[myPerson class]]); // 0
        NSLog(@"%d", [myPerson isMemberOfClass:[myPerson class]]); // 0
        
        NSLog(@"--------");//类对象

        id person = [[myPerson alloc] init];

        NSLog(@"%d", [person isMemberOfClass:[myPerson class]]);//1
        NSLog(@"%d", [person isMemberOfClass:[NSObject class]]);//0

        NSLog(@"%d", [person isKindOfClass:[myPerson class]]);//1
        NSLog(@"%d", [person isKindOfClass:[NSObject class]]);//1

        
        NSLog(@"--------"); //元类对象

        NSLog(@"%d", [myPerson isMemberOfClass:object_getClass([myPerson class])]);//1
        NSLog(@"%d", [myPerson isKindOfClass:object_getClass([NSObject class])]);//1
        NSLog(@"%d", [myPerson isKindOfClass:[NSObject class]]); //1
        
    }
    return 0;
}
