//
//  AppDelegate.h
//  Fleap
//
//  Created by Yuning Jin on 10/15/16.
//  Copyright © 2016 Noctiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NOCProtocol.h"
#import "NOCKeyValueObject.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NOCProtocol *NProtocol;
@property (strong, nonatomic) NOCKeyValueObject *NKVO;

@end

