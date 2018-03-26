//
//  CancelState.h
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CancelState : NSObject

+ (CancelState *) cancellableDispatchAfter:(dispatch_time_t)when queue:(dispatch_queue_t) queue block:(dispatch_block_t) block;

@property (assign, nonatomic) BOOL cancelled;

@end
