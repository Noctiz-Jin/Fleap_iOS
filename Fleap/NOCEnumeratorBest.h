//
//  NOCEnumeratorBest.h
//  Fleap
//
//  Created by Yuning Jin on 5/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCEnumeratorBest : NSObject

- (instancetype)initWithNestedNumberArray:(NSArray *)array;

- (id)nextObject;
- (NSArray *)allObjects;

@end
