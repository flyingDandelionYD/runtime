//
//  myPerson.m
//  02.位域
//


#import "myPerson.h"

@interface myPerson()
{
    // 位域
    struct {
        char tall : 1;//占一位（倒数第一位）
        char rich : 1;//占一位（倒数第二位）
        char handsome : 1;//占一位 （倒数第三位）
    } _tallRichHandsome;  // 0b0000 0000
}
@end

@implementation myPerson

- (void)setTall:(BOOL)tall{
    _tallRichHandsome.tall = tall;
}

- (BOOL)isTall{
    return !!_tallRichHandsome.tall;
}

- (void)setRich:(BOOL)rich{
    _tallRichHandsome.rich = rich;
}

- (BOOL)isRich{
    return !!_tallRichHandsome.rich;
}

- (void)setHandsome:(BOOL)handsome{
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isHandsome{
    return !!_tallRichHandsome.handsome;
}
@end
