//
//  myPerson.m
//  12.dynamic
//


#import "myPerson.h"
#import <objc/runtime.h>

/*
说明：写了属性，编译器会自动生成set、get方法，以及 _ 成员变量（@synthesize age = _age, height = _height;）
@synthesize age = abc也可以（生成对应的abc成员变量）
 */

@implementation myPerson
//提醒编译器不要自动生成setter和getter的实现、不要自动生成_成员变量
@dynamic age;
void setAge(id self, SEL _cmd, int age){
    NSLog(@"age is %d", age);
}

int age(id self, SEL _cmd){
    return 120;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(setAge:)) {
        class_addMethod(self, sel, (IMP)setAge, "v@:i");
        return YES;
    } else if (sel == @selector(age)) {
        class_addMethod(self, sel, (IMP)age, "i@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//@synthesize age = _age;
//- (void)setAge:(int)age{
//    _age = age;
//}
//- (int)age{
//    return _age;
//}
@end
