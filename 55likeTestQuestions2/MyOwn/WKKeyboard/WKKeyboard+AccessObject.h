//
//  WKKeyboard+AccessObject.h
//  WKProject
//
//  Created by 王 on 2017/4/3.
//  Copyright © 2017年 WK. All rights reserved.
//

#import "WKKeyboard.h"
#import <objc/runtime.h>
#import "WKKeyboardObjects.h"

@interface WKKeyboard (AccessObject)

+ (WKKeyboardObjects *)objects;

@end
