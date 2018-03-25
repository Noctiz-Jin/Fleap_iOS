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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *launchButton;
@property (weak, nonatomic) id<NOCDelegate> delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.launchButton.transform = CGAffineTransformMakeRotation(M_PI/4);
    //self.launchButton.bounds = CGRectMake(-50, -50, 264, 201);
    UIView *box = [[UIView alloc] initWithFrame:self.launchButton.frame];
    [box setBackgroundColor:[UIColor grayColor]];
    [self.view insertSubview:box atIndex:0];
    
    self.delegate = [(AppDelegate *)[[UIApplication sharedApplication] delegate] NProtocol];
}

- (IBAction)launchAlgorithm:(UIButton *)sender {
    
    NSLog(@"---Launched Algorithm---");
    
    NSLog(@"%@", [self.delegate delegateCoalescing:@"PiPi" and:@"POP"]);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
