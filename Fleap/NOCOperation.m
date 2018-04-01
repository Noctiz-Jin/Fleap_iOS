//
//  NOCOperation.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCOperation.h"

@implementation NOCOperation

+(NSOperation *)operationWithBlock:(void (^)(NSString *task))block
{
    NSString *theTask = @"Z Task";
    NSBlockOperation *result = [NSBlockOperation blockOperationWithBlock:^{
        block(theTask);
    }];
    return result;
}

+(NSOperation *)operationWithNoc
{
    NSInvocationOperation *result = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doSomthing:) object:@"B Task"];
    return result;
}

- (void)doSomthing:(NSString *)task
{
    NSLog(@"Noctiz Operation Activated");
    NSLog(@"Noctiz Operation Working on %@", task);
}

@end
