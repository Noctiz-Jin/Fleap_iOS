//
//  ViewController.m
//  Fleap
//
//  Created by Yuning Jin on 10/15/16.
//  Copyright © 2016 Noctiz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NOCProtocol.h"
#import "NOCNotification.h"
#import "NOCKeyValueObject.h"
#import "NOCEnumerator.h"
#import "CancelState.h"
#import "NOCPersistence.h"
#import "NOCOperation.h"
#import <objc/runtime.h>

static void *NOCExampleContext = &NOCExampleContext;


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *launchButton;
@property (weak, nonatomic) id<NOCDelegate> delegate;
@property (strong, nonatomic) NOCNotification *NN;

// KVC
@property (strong, nonatomic) NSString *kvc;
@property (strong, nonatomic) NOCKeyValueObject *kvo;

// Cancelled dispatch after
@property (strong, nonatomic) CancelState *cancelState;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Some UI tricks
    self.launchButton.transform = CGAffineTransformMakeRotation(M_PI/4);
    //self.launchButton.bounds = CGRectMake(-50, -50, 264, 201);
    UIView *box = [[UIView alloc] initWithFrame:self.launchButton.frame];
    [box setBackgroundColor:[UIColor grayColor]];
    [self.view insertSubview:box atIndex:0];
    
    // KVO
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] addObserver:self forKeyPath:@"NKVO.name" options:(NSKeyValueObservingOptionNew |
                                                            NSKeyValueObservingOptionOld) context:NULL];
    // KVC
    self.kvo = [[NOCKeyValueObject alloc] init];
    self.kvo.name = @"OLD";
    [self.kvo addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew |
                                                           NSKeyValueObservingOptionOld) context:NULL];

    // Notification
    self.NN = [[NOCNotification alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hear:) name:NOCNotificationKey object:nil];
    // Delegation
    self.delegate = [(AppDelegate *)[[UIApplication sharedApplication] delegate] NProtocol];
}

#pragma mark - Main Test Ground

- (IBAction)applySomething:(UIButton *)sender {
    
//    // Dispatch Cancellation
//    self.cancelState.cancelled = YES;
}

- (IBAction)launchAlgorithm:(UIButton *)sender {
    NSLog(@"---Launched Algorithm---");

    // GCD
//    dispatch_queue_t serial = dispatch_queue_create("com.example.Noctiz", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t concurrent = dispatch_queue_create("com.example.Noctiz", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t mainQ = dispatch_get_main_queue();
//    dispatch_queue_t globalConcurrent = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);// every queue you define will be targeting on DISPATCH_QUEUE_PRIORITY_DEFAULT
    
    
//    // NSOperation
//    NSOperationQueue *myQueue = [NSOperationQueue new];
//    [myQueue addOperation:[NOCOperation operationWithBlock:^(NSString *task) {
//        NSLog(@"Assign %@ to Noctiz", task);
//    }]];
    
//    // KVO
//    [[(AppDelegate *)[[UIApplication sharedApplication] delegate] NKVO] setName:@"new Noctiz"];
//    self.kvo.name = @"new name bro";
    
//    // KVC (used to refer to a object graph, but we only know what to get until runtime)
//    [self setValue:@"new value dude" forKey:@"kvc"];
//    NSLog(@"%@", [self valueForKey:@"kvc"]);
//    NSLog(@"%@", [self valueForKeyPath:@"kvo.name"]);
//    [self setValue:@"NEW" forKeyPath:@"kvo.name"];
//    NSLog(@"%@", [self valueForKeyPath:@"kvo.name"]);

//    // Notification
//    [self.NN postSomeNotification];
//
//    // Delegation
//    NSLog(@"%@", [self.delegate delegateCoalescing:@"PiPi" and:@"POP"]);
}

#pragma mark - Others

// KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"KeyPath: %@", keyPath);
    NSLog(@"Object: %@", object);
    NSLog(@"change: %@", change);
}

// Notification
- (void)hear:(NSNotification *)notif
{
    NSLog(@"I hear: name: %@ object: %@ userInfo:%@", notif.name, notif.object, notif.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] removeObserver:self forKeyPath:@"NKVO.name"];
    [_kvo removeObserver:self forKeyPath:@"name"];
}

@end
