//
//  DataModel.m
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

+(DataModel *)getModelWithDict:(NSDictionary *)dict
{
    DataModel * model = [[DataModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
