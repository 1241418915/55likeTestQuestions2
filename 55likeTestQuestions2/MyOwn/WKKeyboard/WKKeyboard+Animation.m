//
//  WKKeyboard+Animation.m
//  WKProject
//
//  Created by 王 on 2017/4/3.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "WKKeyboard+Animation.h"
#import "WKKeyboard+AccessObject.h"

@implementation WKKeyboard (Animation)


#pragma mark - class method
+ (void)changeFirstResponder:(UIView *)newFirstResponderView
{
    if ([self objects].isKeyboardShow)
    {
        [self wkNewView:newFirstResponderView];
        [self objects].firstResponderView = newFirstResponderView;
    }
    else
    {
        [self objects].firstResponderView = newFirstResponderView;
    }
}

+ (void)wkKeyboardAnimation
{
    CGFloat currentKeyboardHeight       = MAX([self currentKeyboardFrame].origin.x, [self currentKeyboardFrame].origin.y);
    CGRect currentFirstResponderFrame   = [self currentFirstResponderFrame:[self objects].firstResponderView];
    CGFloat viewFloor                   = currentFirstResponderFrame.origin.y + currentFirstResponderFrame.size.height;
    BOOL isCrossOnKeyboard              = (viewFloor >= currentKeyboardHeight);
    
    if (isCrossOnKeyboard && [self objects].isKeyboardShow)
    {
        CGFloat currentShift = viewFloor - currentKeyboardHeight - [self objects].shiftHeight+20;
        
        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            
            CGRect newFrame     = [self objects].observerView.frame;
            newFrame.origin.y   = [self objects].observerView.frame.origin.y - currentShift;
            [self objects].observerView.frame = newFrame;
            
        } completion:^(BOOL finished) {
            
            [self objects].shiftHeight = -[self objects].observerView.frame.origin.y;
        }];
    }
    else if (![self objects].isKeyboardShow)
    {
        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            
            [self objects].observerView.frame = [self objects].originalViewFrame;
            
        } completion:^(BOOL finished) {
            
            [self objects].shiftHeight = 0;
        }];
    }
}


#pragma mark - private method
+ (void)wkNewView:(UIView *)newView
{
    CGFloat currentKeyboardHeight       = MAX([self currentKeyboardFrame].origin.x, [self currentKeyboardFrame].origin.y);
    CGRect currentFirstResponderFrame   = [self currentFirstResponderFrame:newView];
    CGFloat viewFloor                   = currentFirstResponderFrame.origin.y + currentFirstResponderFrame.size.height;
    BOOL isCrossOnKeyboard              = (viewFloor >= currentKeyboardHeight);
    
    if (isCrossOnKeyboard)
    {
        CGFloat currentShift = viewFloor - currentKeyboardHeight - [self objects].shiftHeight;
        
        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            
            CGRect newFrame     = [self objects].observerView.frame;
            newFrame.origin.y   = [self objects].observerView.frame.origin.y - currentShift;
            [self objects].observerView.frame = newFrame;
            
        } completion:^(BOOL finished) {
            
            [self objects].shiftHeight = -[self objects].observerView.frame.origin.y;
        }];
    }
    else
    {
        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            
            [self objects].observerView.frame = [self objects].originalViewFrame;
            
        } completion:^(BOOL finished) {
            
            [self objects].shiftHeight = 0;
        }];
    }
}

+ (CGRect)currentKeyboardFrame
{
    return [[self objects].textEffectsWindow convertRect:[self objects].keyboardFrame fromView:nil];
}

+ (CGRect)currentFirstResponderFrame:(UIView *)view
{
    CGRect currentFirstResponderFrame   = [[self objects].textEffectsWindow convertRect:view.frame fromView:view.superview];
    currentFirstResponderFrame.origin.y += [self objects].shiftHeight;
    
    return currentFirstResponderFrame;
}


@end
