//
//  NSObject+json.m
//  17.runtime的使用-字典转模型
//
my_
//

#import "NSObject+json.h"
#import <objc/runtime.h>

@implementation NSObject (json)
+ (instancetype)my_objectWithJson:(NSDictionary *)json{
    id obj = [[self alloc] init];
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (unsigned int i = 0; i < count; i++) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSMutableString *name = [NSMutableString stringWithUTF8String:ivar_getName(ivar)];
        [name deleteCharactersInRange:NSMakeRange(0, 1)];
        
        // 设值
        id value = json[name];
        if ([name isEqualToString:@"ID"]){
            value = json[@"id"];
        }
        [obj setValue:value forKey:name];
    }
    free(ivars);
    return obj;
}
@end
