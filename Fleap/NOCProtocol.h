//
//  NOCProtocol.h
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
@protocol NOCCDelegate <NSObject>

@required
- (NSString *)delegateCoalescing:(NSString *)s1 and:(NSString *)s2;
@optional
- (void)delegatePrint:(NSString *)s;
@end

@interface NOCProtocol : NSObject <NOCDelegate>


@end
