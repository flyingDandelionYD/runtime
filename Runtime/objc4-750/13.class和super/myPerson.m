//
//  myPerson.m
//  13.class和super
//


#import "myPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>



@implementation myPerson

-(instancetype)init{
    if(self = [super init]){
        
        NSLog(@"[self class] = %@",[self class]); //[self class] = myPerson
        NSLog(@"[super class] = %@",[super class]);//[super class] = myPerson
        NSLog(@"[self  superclass] = %@",[self superclass]); //[self  superclass] = myAnimal
        NSLog(@"[super superclass] = %@",[super superclass]);//[super superclass] = myAnimal
    }
    return self;
}

-(void)run{
    
    //    [super run];
    
        struct objc_super arg = {self, [myAnimal class]};
        ((Class (*)(struct objc_super *, SEL))(void *)objc_msgSendSuper)(&arg, @selector(run));
}
@end

//xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m  -o main.cpp

/*
 
 static instancetype _I_myPerson_init(myPerson * self, SEL _cmd) {
 if(self = ((myPerson *(*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("myPerson"))}, sel_registerName("init"))){
 
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_nn_5r5gqvmx1xz7008s3sn5kfb00000gn_T_myPerson_12047e_mi_0,((Class (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("class")));
 
 
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_nn_5r5gqvmx1xz7008s3sn5kfb00000gn_T_myPerson_12047e_mi_1,((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("myPerson"))}, sel_registerName("class")));
 
 
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_nn_5r5gqvmx1xz7008s3sn5kfb00000gn_T_myPerson_12047e_mi_2,((Class (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("superclass")));
 
 
 NSLog((NSString *)&__NSConstantStringImpl__var_folders_nn_5r5gqvmx1xz7008s3sn5kfb00000gn_T_myPerson_12047e_mi_3,((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("myPerson"))}, sel_registerName("superclass")));
 
 }
 return self;
 }
 
 */
