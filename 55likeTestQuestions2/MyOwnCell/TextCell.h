//
//  TextCell.h
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextCell : UITableViewCell
@property (nonatomic,strong) UITextView * contentTextView;
@property (nonatomic,strong) UIButton * deleteBtn;
@property (nonatomic,strong) UIButton * uploadBtn;
@property (nonatomic,strong) UIButton * downloadBtn;
@end
