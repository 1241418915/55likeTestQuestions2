//
//  DataModel.h
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy) NSString * content;
@property (nonatomic,copy) UIImage * image;
+(DataModel *)getModelWithDict:(NSDictionary *)dict;
@end
