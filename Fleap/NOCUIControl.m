//
//  NOCUIControl.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCUIControl.h"

typedef NS_ENUM(NSInteger, NOCEnum) {
    NOCEnumZero  = 0,
    NOCEnumOne = 1,
    NOCEnumTwo  = 2,
    NOCEnumThree = 3,
};

@interface NOCUIControl ()

@property (nonatomic, strong) NSMutableArray<NOCUIControlTargetAction *> *targetActions;
@property (nonatomic, strong) NSMutableSet<NSString *> *targetActionSet;

@end

@implementation NOCUIControl

- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [self.targetActions addObject:[[NOCUIControlTargetAction alloc] initWithTarget:target action:action event:controlEvents]];
}


- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents
{
    for (NOCUIControlTargetAction *ta in self.targetActions)
    {
        if (controlEvents == ta.event)
        {
            // Do something
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation NOCUIControlTargetAction

- (instancetype)initWithTarget:(id)target action:(SEL)action event:(UIControlEvents)event
{
    self = [super init];
    if (self)
    {
        _target = target;
        _action = action;
        _event = event;
    }
    
    return self;
}

@end
