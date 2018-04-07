//
//  NOCKeyValueObject.h
//  Fleap
//
//  Created by Yuning Jin on 3/24/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOCKeyValueObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NOCKeyValueObject *brother;

@end

@interface NOCKVC1 : NSObject

@property (strong, nonatomic) NSArray *a1;

@end

@interface NOCKVC2 : NSObject

@property (strong, nonatomic) NSArray *a2;

@end

@interface NOCKVC3 : NSObject

@property (strong, nonatomic) NSString *a3;

@end
