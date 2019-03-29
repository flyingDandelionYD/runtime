//
//  main.m
//  06.方法缓存
//


#import <Foundation/Foundation.h>
#import "myClassInfo.h"
#import "myBoy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        myPerson *p = [[myPerson alloc]init];
        [p test];
        [p test];
        
        my_objc_class *myPersonClass = (__bridge my_objc_class *)[myPerson class];
        cache_t cache = myPersonClass->cache;
        
        NSLog(@"%s %p", @selector(test), cache.imp(@selector(test)));
        NSLog(@"--------");
        
        bucket_t *buckets = cache._buckets;
        bucket_t bucket = buckets[(long long)@selector(test) & cache._mask];
        NSLog(@"%s %p", bucket._key, bucket._imp);
        
        NSLog(@"--------");
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p", bucket._key, bucket._imp);
        }
        
        NSLog(@"-----------------Boy-----------------");
        myBoy *boy = [[myBoy alloc]init];
        [boy test];
        [boy test];
        my_objc_class *myBoyClass = (__bridge my_objc_class *)[myBoy class];
        cache_t cache2 = myBoyClass->cache;
        
        NSLog(@"%s %p", @selector(test), cache2.imp(@selector(test)));
        NSLog(@"--------");
        
        bucket_t *buckets2 = cache2._buckets;
        bucket_t bucket2 = buckets2[(long long)@selector(test) & cache2._mask];
        NSLog(@"%s %p", bucket2._key, bucket2._imp);
        
        NSLog(@"--------");
        for (int i = 0; i <= cache2._mask; i++) {
            bucket_t bucket2 = buckets2[i];
            NSLog(@"%s %p", bucket2._key, bucket2._imp);
        }
         */
        
        myPerson *p = [[myPerson alloc]init];
        [p test];
        [p test2];
        [p test3];
        
        my_objc_class *myPersonClass = (__bridge my_objc_class *)[myPerson class];
        cache_t cache = myPersonClass->cache;
        bucket_t *buckets = cache._buckets;
        
        NSLog(@"--------");
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p", bucket._key, bucket._imp);
        }
        NSLog(@"===End====");
    }
    return 0;
}
