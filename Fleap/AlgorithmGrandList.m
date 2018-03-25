//
//  AlgorithmGrandList.m
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "AlgorithmGrandList.h"

@implementation AlgorithmGrandList

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

@end
