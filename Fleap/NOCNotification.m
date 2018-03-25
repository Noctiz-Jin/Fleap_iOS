//
//  NOCNotification.m
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCNotification.h"

@implementation NOCNotification

- (void) postSomeNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOCNotificationKey object:self userInfo:@{@"name": @"noctiz"}];
}

@end
