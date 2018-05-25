//
//  NOCStack.h
//  Fleap
//
//  Created by Yuning Jin on 4/22/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCStack <__covariant objectType> : NSObject

- (BOOL)isEmpty;
- (nullable objectType)top;
- (void)pop;
- (void)push:(nonnull objectType)input;

@end
