//
//  CancelState.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "CancelState.h"

@implementation CancelState

+ (CancelState *) cancellableDispatchAfter:(dispatch_time_t)when queue:(dispatch_queue_t) queue block:(dispatch_block_t) block {
    CancelState *cancelState = [[CancelState alloc] init];
    // the newBlock only runs after "when" and only if the cancelState bool value is set to false
    void (^newBlock)(void) = ^{
        if (cancelState.cancelled == NO)
        {
            block();
        }
    };
    dispatch_after(when, queue, newBlock);
    return cancelState;
}

@end
