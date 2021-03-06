//
//  NOCEnumerator.h
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCEnumerator : NSObject

- (instancetype)initWithNestedNumberArray:(NSArray *)array;

- (id)nextObject;
- (NSArray *)allObjects;

@end
