//
//  main.m
//  17.runtime的使用-字典转模型
//
my_
//

#import <Foundation/Foundation.h>
#import "NSObject+json.h"
#import "myPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 字典转模型
        NSDictionary *json = @{
                               @"id" : @20,
                               @"height" : @20,
                               @"weight" : @60,
                               @"name" : @"Jack"
                               };
        myPerson *person = [myPerson my_objectWithJson:json];
        NSLog(@"id=>%d height=>%f  weight=>%f  name=>%@",person.ID,person.height,person.weight,person.name);

    }
    return 0;
}
