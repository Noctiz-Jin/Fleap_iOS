//
//  CancelState.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "CancelState.h"
#import <UIKit/UIKit.h>

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

// Pretend you're given a simple iOS app with a table view and a text field which looks like a search bar. It has methods to call to a remote server to get potential auto complete words. Describe how you would actually implement the iOS side.
- (void) textFieldDidChange:(UITextField *)searchField
{
//    // if we already had a cancelState object for a potentially running query, cancel it
//    if (self.cancelState) {
//        self.cancelState.cancelled = YES;
//    }
//
//    // do the work asynchronously in the background
//    self.cancelState = [CancelState cancellableDispatchAfter:0 queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:^{
//        self.resultContents = [ServerConn autocompleteSearchField: text];
//        // once we have results from the server, update the UI on the main thread
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }];
}

@end
