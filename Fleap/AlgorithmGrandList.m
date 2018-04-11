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

- (BOOL)isPalindrome:(NSString *)s
{
    NSUInteger left = 0, right = [s length] - 1;
    
    while (left < right)
    {
        char l = [s characterAtIndex:left];
        char r = [s characterAtIndex:right];
        if (l != r) return NO;
        left++;
        right--;
    }
    return YES;
}

- (void)printViews:(UIView *)view
{
    if (view != nil)
    {
        NSLog(@"%zd", view.tag);
        NSLog(@"%@", [view subviews]);
    }
    for (NSUInteger i = 0; i < [view.subviews count]; i++)
    {
        [self printViews:view.subviews[i]];
    }
    
//    UIView *a = [UIView new];
//    a.tag = 1;
//    UIView *q = [UIView new];
//    q.tag = 2;
//    UIView *w = [UIView new];
//    w.tag = 3;
//    UIView *x = [UIView new];
//    x.tag = 4;
//    
//    [a addSubview:q];
//    [a addSubview:w];
//    [w addSubview:x];
//    
//    [self printViews:a];
}

- (NSNumber *)versionCompare:(NSString *)v1 andVersion:(NSString *)v2
{
    NSArray *a1 = [v1 componentsSeparatedByString:@"."];
    NSArray *a2 = [v2 componentsSeparatedByString:@"."];
    NSUInteger s1 = [a1 count];
    NSUInteger s2 = [a2 count];
    NSUInteger size = s1 > s2 ? s1 : s2;
    for (NSUInteger i = 0; i < size; i++)
    {
        NSUInteger n1;
        NSUInteger n2;
        NSNumberFormatter *f = [NSNumberFormatter new];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        if (i < [a1 count]) n1 = [[f numberFromString:a1[i]] unsignedIntegerValue];
        else n1 = 0;
        
        if (i < [a2 count]) n2 = [[f numberFromString:a2[i]] unsignedIntegerValue];
        else n2 = 0;
        
        if (n1 > n2) return @1;
        else if (n1 < n2) return @2;
    }
    
    return @0;
    
//    NSString *v1 = @"12.4.1.3";
//    NSString *v2 = @"12.3.2.3";
//    NSNumber *result = [self versionCompare:v1 andVersion:v2];
//    NSLog(@"%@", result);
}

@end
