//
//  NOCUIControl.h
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NOCUIControlTargetAction : NSObject

- (instancetype) initWithTarget:(id)target action:(SEL)action event:(UIControlEvents)event;

@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) UIControlEvents event;
//@property (nonatomic, strong) NSString *tag;

@end

@interface NOCUIControl : UIControl

@end
