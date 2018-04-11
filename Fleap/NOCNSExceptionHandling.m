//
//  NOCNSExceptionHandling.m
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCNSExceptionHandling.h"

@implementation NOCNSExceptionHandling

- (void)testException
{
    NSString *test = @"test";
    unichar a;
    int index = 5;
    
    @try {
        a = [test characterAtIndex:index];
    }
    @catch (id exception) {
        [self.class handleException:exception];
    }
    @finally {
        NSLog(@"Char at index %d cannot be found", index);
        NSLog(@"Max index is: %lu", [test length] - 1);
    }
    
    @try {
        NSException *exp = [NSException
                            exceptionWithName:@"FileNotFoundException"
                            reason:@"File Not Found on System"
                            userInfo:@{@"user":@"Noctiz"}];
        @throw exp;
        NSError *error = [NSError errorWithDomain:@"NoctizErrorDomain" code:-1223 userInfo:@{@"alert":@"invasion"}];
        @throw error;
    }
    @catch (id e) {
        [self.class handleException:e];
    }
    @finally {
        
    }
}

+ (void)handleException:(id)e
{
    if([e isKindOfClass:[NSException class]]) {
        NSLog(@"NOC: Caught Exception in Flurry Analytics Code");
        NSLog(@"NOC: -----------------------------------------");
        NSLog(@"NOC: Name:%@ Reason:%@", [e name], [e reason]);
        NSLog(@"NOC: %@", [e userInfo]);
    }
    else if([e isKindOfClass:[NSError class]]) {
        NSLog(@"NOC: Caught Error in Flurry Analytics Code");
        NSLog(@"NOC: -----------------------------------------");
        NSLog(@"NOC: Code:%ld Domain:%@", (long)[e code], [e domain]);
        NSLog(@"NOC: %@", [e userInfo]);
    }
    else {
        NSLog(@"NOC: Caught Error in Flurry Analytics Code");
        NSLog(@"NOC: %@", e);
    }
}

@end
