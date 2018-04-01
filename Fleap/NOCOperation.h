//
//  NOCOperation.h
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCOperation : NSObject

+(NSOperation *)operationWithNoc;

+(NSOperation *)operationWithBlock:(void (^)(NSString *task))block;

@end
