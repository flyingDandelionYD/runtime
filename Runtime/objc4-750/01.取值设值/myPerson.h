//
//  myPerson.h
//  01.取值设值
//


#import <Foundation/Foundation.h>
@interface myPerson : NSObject
- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;

- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;
@end

