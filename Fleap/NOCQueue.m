//
//  NOCQueue.m
//  Fleap
//
//  Created by Yuning Jin on 4/22/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//


#import "NOCQueue.h"

@interface NOCQueue <__covariant objectType> ()

@property (nonatomic, strong) NSMutableArray<id> *backData;

@end

@implementation NOCQueue

- (instancetype) init
{
    self = [super init];
    if (self)
    {
        _backData = [NSMutableArray new];
    }
    
    return self;
}

- (BOOL)isEmpty;
{
    return [self.backData count] == 0;
}

- (void)pop
{
    if ([self isEmpty]) return;
    [self.backData removeObjectAtIndex:0];
}
- (nullable id)front
{
    if ([self isEmpty]) {
        return nil;
    }
    
    return [self.backData firstObject];
}

- (void)push:(nonnull id)input
{
    if (input == nil) return;
    [self.backData addObject:input];
}

- (NSUInteger)size
{
    return [self.backData count];
}

@end

