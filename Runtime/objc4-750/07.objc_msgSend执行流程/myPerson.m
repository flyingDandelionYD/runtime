//
//  myPerson.m
//  07.objc_msgSend执行流程
//


#import "myPerson.h"

@implementation myPerson
+(void)walk{
    NSLog(@"%s",__FUNCTION__);
}
-(void)run{
    NSLog(@"%s",__FUNCTION__);
}
-(void)sayHello:(NSString*)name{
    NSLog(@"%s--%@",__FUNCTION__,name);
}
-(NSString*)sayGoodBye:(NSString*)name{
    return [NSString stringWithFormat:@"%@",name];
}
@end
