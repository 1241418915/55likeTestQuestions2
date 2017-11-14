//
//  WKKeyboard.h
//  WKProject
//
//  Created by 王 on 2017/4/3.
//  Copyright © 2017年 WK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKKeyboard : NSObject


#pragma mark - 添加键盘通知
/**
 *  在viewController起始位置的地方添加该方法即可
 *
 *  @param view 这里的view，是需要上移的view
 */
+ (void)addRegisterTheViewNeedWKKeyboard:(UIView *)view;


#pragma mark - 移除键盘通知
/**
 *  在结束的地方添加该方法即可
 */
+ (void)removeRegisterTheViewNeedWKKeyboard;

@end
