//
//  myPerson.h
//  07.objc_msgSend执行流程
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface myPerson : NSObject
+(void)walk;
-(void)run;
-(void)sayHello:(NSString*)name;
-(NSString*)sayGoodBye:(NSString*)name;
@end

NS_ASSUME_NONNULL_END
