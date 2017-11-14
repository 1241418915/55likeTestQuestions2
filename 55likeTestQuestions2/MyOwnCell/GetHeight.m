//
//  GetHeight.m
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "GetHeight.h"

@implementation GetHeight
+(CGFloat)getHeightWithLimitSize:(CGSize)size Content:(NSString *)content font:(UIFont *)font
{
    CGFloat h = [content boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height + 10;
    
    return h;
}
@end
