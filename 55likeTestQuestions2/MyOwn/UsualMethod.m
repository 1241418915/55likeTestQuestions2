//
//  UsualMethod.m
//  RuanRongDai
//
//  Created by RUAN-JSB-WWB on 2017/8/25.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "UsualMethod.h"

@implementation UsualMethod

#pragma mark - 时间戳转化时间
+(NSString *)getTimeStrWithtimer:(NSString *)str
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeInterval  timer = [str integerValue];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timer];
    NSString * showDate = [formatter stringFromDate:date];
    
    return showDate;
}
#pragma mark - 时间转化时间戳
+(NSString *)getTimerWithTimeStr:(NSString *)str
{
    
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate * date = [formatter dateFromString:str];
    
    
    NSString *timeSp = [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
    
    return timeSp;
}
#pragma mark - 转化 base64
+(NSString *)getImageDataBase64WithImage:(UIImage *)image
{
    NSData *data = nil;
    if (UIImageJPEGRepresentation(image, 0.3) == nil)
    {
        data = UIImagePNGRepresentation(image);
    }
    else
    {
        data = UIImageJPEGRepresentation(image, 0.3);
    }
    NSString *encodedString = [data base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
    return encodedString;
}

#pragma mark -  获取当前控制器
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [UsualMethod getCurrentVCFrom:rootViewController];
    return currentVC;
}
+(UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]])
    {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    }
    else if ([rootVC isKindOfClass:[UINavigationController class]])
    {
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    } return currentVC;
}
@end
