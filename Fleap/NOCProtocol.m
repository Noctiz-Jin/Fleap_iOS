//
//  NOCProtocol.m
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCProtocol.h"

@implementation NOCProtocol

- (NSString *)delegateCoalescing:(NSString *)s1 and:(NSString *)s2
{
    NSString *result = [NSString stringWithFormat:@"%@ AND %@", s1, s2];
    return result;
}

@end
