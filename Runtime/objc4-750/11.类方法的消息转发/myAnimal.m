//
//  myAnimal.m
//  11.类方法的消息转发
//


#import "myAnimal.h"

@implementation myAnimal
+(void)test{
    NSLog(@"%s",__FUNCTION__);
}
- (void)test{
    NSLog(@"%s",__FUNCTION__);
}
@end
