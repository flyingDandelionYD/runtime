//
//  main.m
//  04.枚举或
//


#import <Foundation/Foundation.h>
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        myPerson *p = [[myPerson alloc]init];
        p.option = OptionsOne | OptionsTwo | OptionsThree | OptionsFour;
    }
    return 0;
}
