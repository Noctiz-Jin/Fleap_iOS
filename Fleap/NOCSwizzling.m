//
//  NOCSwizzling.m
//  Fleap
//
//  Created by Yuning Jin on 4/1/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCSwizzling.h"
#import <objc/runtime.h>

void (*methodCache)(id, SEL) = NULL;

@implementation NOCSwizzling

- (void)swizzleMethod
{
    
    Class targetClass = NSClassFromString(@"NOCSwizzling");
    SEL selMethod = @selector(printSomething);
    Method swizzledMethod = class_getClassMethod(targetClass, selMethod);
    typedef BOOL (*OriginalType)(id, SEL);
//    IMP origImplementation = (IMP)(OriginalType)class_getMethodImplementation(targetClass, selMethod);
//    methodCache = (OriginalType)class_getMethodImplementation(targetClass, selMethod);
    const char *types = method_getTypeEncoding(swizzledMethod);
    IMP newImp =
    imp_implementationWithBlock(^(id self) {
        NSLog(@"HAHA, you got SWIZZLED!");
    });
    class_replaceMethod(targetClass, selMethod, newImp, types);
}

- (void)printSomething
{
    NSLog(@"printSomething normally");
}

@end
