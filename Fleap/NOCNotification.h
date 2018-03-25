//
//  NOCNotification.h
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const NOCNotificationKey = @"co.noctiz.fleap";

@interface NOCNotification : NSObject

- (void) postSomeNotification;

@end
