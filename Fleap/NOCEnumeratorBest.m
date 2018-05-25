//
//  NOCEnumeratorBest.m
//  Fleap
//
//  Created by Yuning Jin on 5/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCEnumeratorBest.h"

@interface NOCEnumeratorBest ()

@property (nonatomic, strong) NSMutableArray *stack;

@end


@implementation NOCEnumeratorBest

- (instancetype)initWithNestedNumberArray:(NSArray *)array
{
    self = [super init];
    if (self)
    {
        _stack = [NSMutableArray new];
        if (array != nil) {
            [_stack addObject:[array objectEnumerator]];
        }
    }
    
    return self;
}

- (id)nextObject
{
    if ([self.stack count] == 0) return nil;
    
    while ([self.stack count] != 0)
    {
        NSEnumerator *en = [self.stack lastObject];
        id temp = [en nextObject];
        if (temp == nil)
        {
            [self.stack removeLastObject];
        } else {
            if ([temp isKindOfClass:[NSArray class]])
            {
                [self.stack addObject:[temp objectEnumerator]];
            } else {
                return temp;
            }
        }
    }
    
    return nil;
}

- (NSArray *)allObjects
{
    NSMutableArray *array = [NSMutableArray new];
    id temp = nil;
    while (temp = [self nextObject]) {
        [array addObject:temp];
    }
    return [array copy];
}

#pragma mark - TEST

- (void)testEnumerator
{
    NSArray *input = @[@[@1], @[@2,@3,@4],@5];
    NOCEnumeratorBest *ne = [[NOCEnumeratorBest alloc] initWithNestedNumberArray:input];
    id item;
    while(item = [ne nextObject])
    {
        NSLog(@"%@", item);
    }
    NSLog(@"%@", [ne allObjects]);
}

@end
