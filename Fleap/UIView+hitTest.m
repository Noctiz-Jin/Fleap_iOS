//
//  UIView+hitTest.m
//  Fleap
//
//  Created by Yuning Jin on 3/21/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "UIView+hitTest.h"

@implementation UIView (hitTest)

//- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event
//{
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    CGRect touchRect = CGRectInset(self.bounds, -10, -10);
//    if (CGRectContainsPoint(touchRect, point)) {
//        for (NSInteger i = [self.subviews count] - 1; i >= 0; i--)
//        {
//            CGPoint convertedPoint = [self.subviews[i] convertPoint:point fromView:self];
//            UIView *hitTestView = [self.subviews[i] hitTest:convertedPoint withEvent:event];
//            if (hitTestView) {
//                return hitTestView;
//            }
//        }
//        return self;
//    }
//    return nil;
//}
//
////Passing touch events through to views below
////Sometimes it is necessary for a view to ignore touch events and pass them through to the views below. For example, assume a transparent overlay view placed above all other application views. The overlay has some subviews in the form of controls and buttons which should respond to touches normally. But touching the overlay somewhere else should pass the touch events to the views below the overlay. To accomplish this behavior the overlay hitTest:withEvent: method could be overridden to return one of its subviews containing the touch-point and nil in all other cases, including the case when the overlay contains the touch-point:
//
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *hitTestView = [super hitTest:point withEvent:event];
//    if (hitTestView == self) {
//        hitTestView = nil;
//    }
//    return hitTestView;
//}
//
//// *** Normal HitTest ***
//- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event
//{
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    if ([self pointInside:point withEvent:event]) {
//        for (NSInteger i = [self.subviews count] - 1; i >= 0; i--)
//        {
//            CGPoint convertedPoint = [self.subviews[i] convertPoint:point fromView:self];
//            UIView *hitTestView = [self.subviews[i] hitTest:convertedPoint withEvent:event];
//            if (hitTestView) {
//                return hitTestView;
//            }
//        }
//        return self;
//    }
//    return nil;
//}

@end
