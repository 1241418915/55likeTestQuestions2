//
//  WKKeyboardObjects.h
//  WKProject
//
//  Created by 王 on 2017/4/3.
//  Copyright © 2017年 WK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKKeyboardObjects : NSObject

/**
 *  观察者view
 */
@property (nonatomic, strong) UIView *observerView;

/**
 *  文本window
 */
@property (nonatomic, strong) UIWindow *textEffectsWindow;

/**
 *  键盘响应view
 */
@property (nonatomic, strong) UIView *firstResponderView;

/**
 *  view的frame
 */
@property (nonatomic, assign) CGRect originalViewFrame;

/**
 *  键盘frame
 */
@property (nonatomic, assign) CGRect keyboardFrame;

/**
 *  弹起高度
 */
@property (nonatomic, assign) CGFloat shiftHeight;

/**
 *  键盘动画时间
 */
@property (nonatomic, assign) double keyboardAnimationDutation;

/**
 *  是否显示键盘
 */
@property (nonatomic, assign) BOOL isKeyboardShow;

@end
