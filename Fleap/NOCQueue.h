//
//  NOCQueue.h
//  Fleap
//
//  Created by Yuning Jin on 4/22/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCQueue <__covariant objectType> : NSObject

- (BOOL)isEmpty;
- (void)pop;
- (nullable objectType)front;
- (void)push:(nonnull objectType)input;
- (NSUInteger)size;

@end
