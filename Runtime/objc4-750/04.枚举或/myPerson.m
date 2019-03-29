//
//  myPerson.m
//  04.枚举或
//


#import "myPerson.h"

@implementation myPerson
-(void)setOption:(Options)option{
    if (option & OptionsOne) {
        NSLog(@"包含了OptionsOne");
    }
    
    if (option & OptionsTwo) {
        NSLog(@"包含了OptionsTwo");
    }
    
    if (option & OptionsThree) {
        NSLog(@"包含了OptionsThree");
    }
    if (option & OptionsFour) {
        NSLog(@"包含了OptionsFour");
    }
}
@end
