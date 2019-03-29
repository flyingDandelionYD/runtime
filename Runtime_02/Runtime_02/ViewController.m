//
//  ViewController.m
//  Runtime_02
//


#import "ViewController.h"
#import "myPerson.h"
#import "UIControl+Extension.h"
#import "NSMutableArray+Extension.h"
#import "NSMutableDictionary+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id cls = [myPerson class];
    
    void *obj = &cls;

    [(__bridge id)obj print];
    
    NSLog(@"=======");
    
    
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM addObject:@"Jack"];
    [arrM addObject:nil];
    NSLog(@"arrM = %@",arrM);
    NSLog(@"=======");
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    [dictM setObject:@"myValue" forKey:@"myKey"];
    [dictM setObject:@"22" forKey:nil];
    [dictM setObject:nil forKey:nil];
    NSLog(@"dictM = %@",dictM);
    
    
}
- (IBAction)click:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}

@end
