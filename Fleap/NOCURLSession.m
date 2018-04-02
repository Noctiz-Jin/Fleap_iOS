//
//  NOCURLSession.m
//  Fleap
//
//  Created by Yuning Jin on 4/1/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCURLSession.h"

@implementation NOCURLSession

- (void)makeNetworkRequest
{
    NSURLSessionConfiguration *myConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    myConfig.allowsCellularAccess = YES;
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:myConfig];
    NSMutableURLRequest *myRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com"]];
    [myRequest setHTTPBody:nil];
    [myRequest addValue:@"my" forHTTPHeaderField:@"wow"];
    NSURLSessionDataTask *myTask = [mySession dataTaskWithRequest:myRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *myResponse = (NSHTTPURLResponse *)response;
        if (myResponse.statusCode == 200)
        {
            NSLog(@"yeah");
        }
        NSData *myData = data;
        [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
        
    }];
    [myTask resume];
}

@end
