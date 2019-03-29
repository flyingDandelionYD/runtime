//
//  myPerson.h
//  03.共同体
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface myPerson : NSObject
- (void)setTall:(BOOL)tall;
- (BOOL)isTall;
- (void)setRich:(BOOL)rich;
- (BOOL)isRich;
- (void)setHandsome:(BOOL)handsome;
- (BOOL)isHandsome;
- (void)setThin:(BOOL)thin;
- (BOOL)isThin;
@end

NS_ASSUME_NONNULL_END
