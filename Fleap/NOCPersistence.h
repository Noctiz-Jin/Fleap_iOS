//
//  NOCPersistence.h
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCPersistence : NSObject <NSCoding>

@property (assign, nonatomic) BOOL myBool;
@property (strong, nonatomic) NSString *myString;

@end
