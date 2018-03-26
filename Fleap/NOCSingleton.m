//
//  NOCSingleton.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCSingleton.h"

@implementation NOCSingleton

+ (instancetype) shareadInstance
{
    static NOCSingleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NOCSingleton alloc] init];
    });
    
    return instance;
}

@end
