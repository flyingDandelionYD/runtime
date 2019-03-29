//
//  main.m
//  05.SEL
//


#import <Foundation/Foundation.h>
#import "myPerson.h"
#import <objc/runtime.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SEL sel1 = @selector(test);
        SEL sel2 = sel_registerName("test");
        NSLog(@"%p",sel1);
        NSLog(@"%p",sel2);
        NSLog(@"%p",sel_registerName("test"));
        
        //
        myPerson *p = [[myPerson alloc]init];
        [p test:10 height:180];
        
        NSLog(@"%s", method_getTypeEncoding(class_getInstanceMethod([myPerson class], @selector(test:height:))));
    }
    return 0;
}
