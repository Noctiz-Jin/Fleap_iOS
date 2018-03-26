//
//  AlgorithmGrandList.m
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "AlgorithmGrandList.h"
#import <UIKit/UIKit.h>

@implementation AlgorithmGrandList
//
- (void)MoveZeroes
{
    NSMutableArray *input = [@[@1, @0, @0, @5] mutableCopy];
    NSUInteger index = 0;
    for (NSUInteger i = 0; i < [input count]; i++)
    {
        if ([input[i] isEqualToNumber:@0] == NO)
        {
            [input exchangeObjectAtIndex:index withObjectAtIndex:i];
            index++;
        }
    }
    
    NSLog(@"%@", input);
}

- (void)TwoSum
{
    NSArray *input = @[@1, @3, @9, @5];
    NSMutableDictionary<NSNumber *, NSNumber *> *map = [@{} mutableCopy];
    NSNumber *target = @8;
    NSMutableArray *result = [NSMutableArray new];
    for (NSUInteger i = 0; i < [input count]; i++)
    {
        if (map[@([target integerValue] - [input[i] integerValue])] != nil)
        {
            [result addObject:map[@([target integerValue] - [input[i] integerValue])]];
            [result addObject:[NSNumber numberWithUnsignedInteger:i]];
        }
        map[input[i]] = [NSNumber numberWithUnsignedInteger:i];
    }
    
    NSLog(@"%@", result);
}

//- (void)testCommonSuperview
//{
//    UIView *a = [UIView new];
//    UIView *q = [UIView new];
//    UIView *w = [UIView new];
//    UIView *x = [UIView new];
//    UIView *y = [UIView new];
//    UIView *c = [UIView new];
//    UIView *z = [UIView new];
//    
//    [a addSubview:q];
//    [a addSubview:w];
//    [w addSubview:x];
//    [w addSubview:y];
//    [w addSubview:c];
//    [c addSubview:z];
//    
//    UIView *result = [self commonSuperview:z andView:q];
//    
//    if ([result isEqual:a])
//    {
//        NSLog(@"ACCEPTED!");
//    } else {
//        NSLog(@"WRONG ANSWER!");
//    }
//}

- (UIView *)commonSuperview:(UIView *)view andView:(UIView *)otherView
{
    if (otherView == nil || view == nil) return nil;
    NSMutableArray *superViewList = [NSMutableArray new];
    UIView *result = view;
    
    while(result != nil)
    {
        [superViewList addObject:result];
        result = result.superview;
    }
    
    result = otherView;
    while (result != nil)
    {
        if ([superViewList containsObject:result]) break;
        result = result.superview;
    }
    
    return result;
}

- (void)removeDuplicate
{
    NSMutableArray *input = [@[@1, @1, @1, @2, @3, @3, @4, @5, @5, @5] mutableCopy];
    NSUInteger index = 1;
    for (NSUInteger i = 1; i < [input count]; i++)
    {
        if ([input[i] isEqualToNumber:input[index - 1]] == NO)
        {
            input[index++] = input[i];
        }
    }
    NSLog(@"%@", [input subarrayWithRange:NSMakeRange(0, index)]);
}

- (void)removeDuplicateAndRemainOrder
{
    NSMutableSet *mySet = [NSMutableSet new];
    NSArray *input = @[@2, @1, @3, @1, @2];
    NSMutableArray *result = [NSMutableArray new];
    for (NSNumber * num in input)
    {
        if ([mySet containsObject:num] == NO)
        {
            [mySet addObject:num];
            [result addObject:num];
        }
    }
    NSLog(@"%@", result);
}
@end
