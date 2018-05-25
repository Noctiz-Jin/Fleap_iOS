//
//  NOCStack.m
//  Fleap
//
//  Created by Yuning Jin on 4/22/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCStack.h"

@interface NOCStack <__covariant objectType> ()

@property (nonatomic, strong) NSMutableArray * backData;

@end

@implementation NOCStack

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _backData = [NSMutableArray new];
    }
    
    return self;
}

- (BOOL)isEmpty
{
    return [self.backData count] == 0;
}

- (nullable id)top
{
    if ([self isEmpty]) return nil;
    return [self.backData lastObject];
}

- (void)pop
{
    if ([self isEmpty]) return;
    [self.backData removeLastObject];
}

- (void)push:(nonnull id)input
{
    if (input == nil) return;
    [self.backData addObject:input];
}

@end

