//
//  myPerson.h
//  04.枚举或
//


#import <Foundation/Foundation.h>
typedef enum {
    OptionsOne = 1<<0, // 0b 0000 0001
    OptionsTwo = 1<<1, // 0b 0000 0010
    OptionsThree = 1<<2,//0b 0000 0100
    OptionsFour = 1<<3 // 0b 0000 1000
} Options;

@interface myPerson : NSObject
@property(nonatomic,assign)Options option;
@end

