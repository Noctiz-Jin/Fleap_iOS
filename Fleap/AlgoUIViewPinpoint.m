//
//  AlgoUIViewPinpoint.m
//  Fleap
//
//  Created by Yuning Jin on 3/21/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "AlgoUIViewPinpoint.h"
#import <UIKit/UIKit.h>

@implementation AlgoUIViewPinpoint

- (void)testUIViewPinpointing
{
    UIView *a = [UIView new];
    UIView *q = [UIView new];
    UIView *w = [UIView new];
    UIView *x = [UIView new];
    
    [a addSubview:q];
    [a addSubview:w];
    [w addSubview:x];
    
    UIView *b = [UIView new];
    UIView *p = [UIView new];
    UIView *o = [UIView new];
    UIView *y = [UIView new];
    
    [b addSubview:p];
    [b addSubview:o];
    [o addSubview:y];
    
    NSMutableArray *path = [NSMutableArray new];
    NSArray *result = [NSArray new];
    [self locateView:x inView:a andPath:path andResult:&result];
    
    NSLog(@"%@", result);
    UIView *temp = [self locateSubview:b andArray:result];
    if ([temp isEqual:y])
    {
        NSLog(@"!! Accepted !!!");
    }
}

- (void)locateView:(UIView *)x inView:(UIView *)a andPath:(NSMutableArray *)path andResult:(NSArray **)result
{
    if ([x isEqual:a]) return;
    for (NSUInteger i = 0; i < [a.subviews count]; i++)
    {
        [path addObject:[NSNumber numberWithUnsignedInteger:i]];
        if ([(UIView *)a.subviews[i] isEqual:x]) {
            *result = [path copy];
            break;
        }
        [self locateView:x inView:(UIView *)a.subviews[i] andPath:path andResult:result];
        [path removeLastObject];
    }
}

- (UIView *)locateSubview:(UIView *)b andArray:(NSArray *)result
{
    UIView *theView = b;
    for (NSUInteger i = 0; i < [result count]; i++)
    {
        theView = theView.subviews[[result[i] unsignedIntegerValue]];
    }
    return theView;
}


//- (void)testUIViewPinpointing
//{
//    UIView *a = [UIView new];
//    UIView *q = [UIView new];
//    UIView *w = [UIView new];
//    UIView *x = [UIView new];
//    
//    [a addSubview:q];
//    [a addSubview:w];
//    [w addSubview:x];
//    
//    UIView *b = [UIView new];
//    UIView *p = [UIView new];
//    UIView *o = [UIView new];
//    UIView *y = [UIView new];
//    
//    [b addSubview:p];
//    [b addSubview:o];
//    [o addSubview:y];
//    
//    NSMutableArray *path = [NSMutableArray new];
//    self.result = [NSArray new];
//    [self locateView:x inView:a andPath:&path];
//    
//    NSLog(@"%@", self.result);
//    UIView *temp = [self locateSubview:b];
//    if ([temp isEqual:y])
//    {
//        NSLog(@"!! Accepted !!!");
//    }
//}
//
//- (void)locateView:(UIView *)x inView:(UIView *)a andPath:(NSMutableArray **)path
//{
//    if ([x isEqual:a]) return;
//    [a.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
//        [*path addObject:[NSNumber numberWithUnsignedInteger:index]];
//        if ([(UIView *)obj isEqual:x]) {
//            self.result = [*path copy];
//            *stop = YES;
//        }
//        [self locateView:x inView:(UIView *)obj andPath:path];
//        [*path removeLastObject];
//    }];
//}
//
//- (UIView *)locateSubview:(UIView *)b
//{
//    UIView *result = b;
//    for (NSUInteger i = 0; i < [self.result count]; i++)
//    {
//        result = result.subviews[[self.result[i] unsignedIntegerValue]];
//    }
//    return result;
//}

@end
