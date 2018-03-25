//
//  NOCEnumerator.m
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCEnumerator.h"

@interface NOCEnumerator ()
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) NSArray *originalArray;
@end

@implementation NOCEnumerator

- (instancetype)initWithNestedNumberArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.originalArray = [array copy];
        self.stack = [NSMutableArray array];
        for (NSInteger i = array.count - 1; i >= 0; i --) {
            [self.stack addObject:array[i]];
        }
    }
    return self;
}

- (id)nextObject
{
    if ([self hasNext]) {
        id next = self.stack.lastObject;
        [self.stack removeLastObject];
        return next;
    }
    else {
        return nil;
    }
}

- (NSArray *)allObjects
{
    //    return [self enumerateAllObjects:self.originalArray];
    
    NSMutableArray *array = [NSMutableArray array];
    while ([self hasNext]) {
        [array addObject:self.stack.lastObject];
        [self.stack removeLastObject];
    }
    return [array copy];
}

- (BOOL)hasNext
{
    id lastObject = self.stack.lastObject;
    
    while (lastObject && [lastObject isKindOfClass:[NSArray class]]) {
        NSArray *temp = (NSArray *)lastObject;
        //need remove the last object if it is an array
        [self.stack removeLastObject];
        //then reversely add all objects of lastObject to stack
        for (NSInteger i = temp.count - 1; i >= 0; i --) {
            [self.stack addObject:temp[i]];
        }
        lastObject = self.stack.lastObject;
    }
    
    if (lastObject && [lastObject isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSArray *)enumerateAllObjects:(NSArray *)array
{
    if (array.count == 0) {
        return array;
    }
    NSMutableArray *res = [NSMutableArray array];
    for (id temp in array) {
        if ([temp isKindOfClass:[NSArray class]]) {
            [res addObjectsFromArray:[self enumerateAllObjects:temp]];
        }
        else {
            [res addObject:temp];
        }
    }
    return res;
}

#pragma mark - TEST

- (void)testEnumerator
{
    NSArray *input = @[@[@1], @[@2,@3,@4],@5];
    NOCEnumerator *ne = [[NOCEnumerator alloc] initWithNestedNumberArray:input];
    id item;
    while(item = [ne nextObject])
    {
        NSLog(@"%@", item);
    }
    NSLog(@"%@", [ne allObjects]);
}

@end
