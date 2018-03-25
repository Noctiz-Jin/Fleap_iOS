//
//  AlgoNSRange.m
//  Fleap
//
//  Created by Yuning Jin on 3/20/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "AlgoNSRange.h"

@implementation AlgoNSRange

- (void) testNSRange
{
    NSRange r1 = NSMakeRange(10, 3);
    NSRange r2 = NSMakeRange(3, 2);
    
    if ([self haveIntersection:r1 andRange:r2])
    {
        NSLog(@"YES!");
        NSRange result = [self rangeOfIntersectionWithRange:r1 andRange:r2];
        NSLog(@"Intersection: %lu - %lu", result.location, result.length);
    }
    else
        NSLog(@"NO!");
    
    NSRange unionRange = NSUnionRange(r1, r2);
    NSLog(@"Union: %lu - %lu", unionRange.location, unionRange.length);
}

- (BOOL)haveIntersection:(NSRange)r1 andRange:(NSRange)r2
{
    if (r1.location == NSNotFound || r2.location == NSNotFound) return NO;
    
    NSUInteger s1 = r1.location;
    NSUInteger s2 = r2.location;
    NSUInteger e1 = r1.location + r1.length - 1;
    NSUInteger e2 = r2.location + r2.length - 1;
    
    if (e1 < s2 || e2 < s1) return NO;
    return YES;
}

- (NSRange)rangeOfIntersectionWithRange:(NSRange)r1 andRange:(NSRange)r2
{
    if ([self haveIntersection:r1 andRange:r2] == NO) return NSMakeRange(NSNotFound, 0);
    NSUInteger s1 = r1.location;
    NSUInteger s2 = r2.location;
    NSUInteger e1 = r1.location + r1.length - 1;
    NSUInteger e2 = r2.location + r2.length - 1;
    
    NSUInteger resultLocation = MAX(s1, s2);
    NSUInteger resultEnd = MIN(e1, e2);
    return NSMakeRange(resultLocation, resultEnd - resultLocation + 1);
}

@end
