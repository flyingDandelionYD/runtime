//
//  myPerson.m
//  03.共同体
//


#import "myPerson.h"
#define myTallMask (1<<0)
#define myRichMask (1<<1)
#define myHandsomeMask (1<<2)
#define myThinMask (1<<3)

@interface myPerson(){
    union {
        int bits;
        struct {
            char tall : 1;
            char rich : 1;
            char handsome : 1;
            char thin : 1;
        };//仅仅是增加可读性，可删除
    } _tallRichHandsome;
}
@end//如果不止4位了，那么不够了就改 int 类型了

@implementation myPerson
- (void)setTall:(BOOL)tall{
    if (tall) {
        _tallRichHandsome.bits |= myTallMask;
    } else {
        _tallRichHandsome.bits &= ~myTallMask;
    }
}

- (BOOL)isTall{
    return !!(_tallRichHandsome.bits & myTallMask);
}

- (void)setRich:(BOOL)rich{
    if (rich) {
        _tallRichHandsome.bits |= myRichMask;
    } else {
        _tallRichHandsome.bits &= ~myRichMask;
    }
}

- (BOOL)isRich{
    return !!(_tallRichHandsome.bits & myRichMask);
}

- (void)setHandsome:(BOOL)handsome{
    if (handsome) {
        _tallRichHandsome.bits |= myHandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~myHandsomeMask;
    }
}

- (BOOL)isHandsome{
    return !!(_tallRichHandsome.bits & myHandsomeMask);
}


- (void)setThin:(BOOL)thin{
    if (thin) {
        _tallRichHandsome.bits |= myThinMask;
    } else {
        _tallRichHandsome.bits &= ~myThinMask;
    }
}

- (BOOL)isThin{
    return !!(_tallRichHandsome.bits & myThinMask);
}
@end
