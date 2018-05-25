//
//  ViewController.h
//  Fleap
//
//  Created by Yuning Jin on 10/15/16.
//  Copyright © 2016 Noctiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NOCDelegate <NSObject>

@required
- (NSString *)delegateCoalescing:(NSString *)s1 and:(NSString *)s2;
@optional
- (void)delegatePrint:(NSString *)s;
@end

@interface ViewController : UIViewController


@end

