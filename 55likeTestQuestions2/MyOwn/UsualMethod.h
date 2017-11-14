//
//  UsualMethod.h
//  RuanRongDai
//
//  Created by RUAN-JSB-WWB on 2017/8/25.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsualMethod : NSObject
+(NSString *)getTimeStrWithtimer:(NSString *)str;
+(NSString *)getTimerWithTimeStr:(NSString *)str;
+(NSString *)getImageDataBase64WithImage:(UIImage *)image;
+(UIViewController *)getCurrentVC;
@end
