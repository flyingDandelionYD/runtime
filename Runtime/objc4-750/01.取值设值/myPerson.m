//
//  myPerson.m
//  01.取值设值
//


#import "myPerson.h"
#define myTallMask (1<<0)
#define myRichMask (1<<1)
#define myHandsomeMask (1<<2)
@interface myPerson(){
    char _tallRichHansome;
}
@end

@implementation myPerson
- (instancetype)init{
    if (self = [super init]) {
        _tallRichHansome = 0b00000100;   //tall 0 ,  rich 0 , handsome 1
    }
    return self;
}

- (void)setTall:(BOOL)tall{
    if (tall) {
        _tallRichHansome |= myTallMask; //设位为1值（或运算   要运算的那位为1，其他的为0）
    } else {
        _tallRichHansome &= ~myTallMask; //设位为0值（与运算   要运算的那位为0，其他的为1）
    }
}

- (BOOL)isTall{
    return !!(_tallRichHansome & myTallMask);
}

- (void)setRich:(BOOL)rich{
    if (rich) {
        _tallRichHansome |= myRichMask;
    } else {
        _tallRichHansome &= ~myRichMask;
    }
}

- (BOOL)isRich{
    return !!(_tallRichHansome & myRichMask);
}

- (void)setHandsome:(BOOL)handsome{
    if (handsome) {
        _tallRichHansome |= myHandsomeMask;
    } else {
        _tallRichHansome &= ~myHandsomeMask;
    }
}

- (BOOL)isHandsome{
    return !!(_tallRichHansome & myHandsomeMask);
}
@end

