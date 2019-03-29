//
//  myPerson.m
//  05.SEL
//


#import "myPerson.h"

@implementation myPerson
- (int)test:(int)age height:(float)height{
    NSLog(@"%s", __func__);
    return 0;
}

// "i  24  @0 :8     i16  f20"  i->int  24->总共24个字节  @ -> SEL    0 -> 从第0个字节开始  8 ->从第8个字节开始   i->int 16 ->从第16个字节开始 f->float  20->从第20个字节开始
// 0id 8SEL 16int 20float  == 24
// 24 id8个字节  SEL8个字节 int4个字节  float4个字节
@end
