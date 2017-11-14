//
//  UIView+WKKeyboardFirstResponderNotify.m
//  WKProject
//
//  Created by 王 on 2017/4/3.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "UIView+WKKeyboardFirstResponderNotify.h"
#import <objc/runtime.h>
#import "WKKeyboard+Animation.h"
#import "WKKeyboard+AccessObject.h"

@implementation UIView (MHKeyboardFirstResponderNotify)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzling:@selector(becomeFirstResponder) to:@selector(swizzling_becomeFirstResponder)];
    });
}

#pragma mark - method swizzling
- (BOOL)swizzling_becomeFirstResponder
{
    if ([WKKeyboard objects].observerView)
    {
        if ([self isViewInSuper:[WKKeyboard objects].observerView])
        {
            [WKKeyboard changeFirstResponder:self];
        }
    }
    return [self swizzling_becomeFirstResponder];
}

#pragma mark - private method
- (BOOL)isViewInSuper:(UIView *)targetView
{
    if (self.superview)
    {
        if (self.superview == targetView)
        {
            return YES;
        }
        
        return [self.superview isViewInSuper:targetView];
    }
    
    return NO;
}

+ (void)swizzling:(SEL)before to:(SEL)after
{
    Class class = [self class];
    
    SEL originalSelector = before;
    SEL swizzledSelector = after;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod)
    {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
