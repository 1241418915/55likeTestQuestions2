//
//  FullScreenImageCell.m
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "FullScreenImageCell.h"

@implementation FullScreenImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
        [self addContentView];
        
    }
    return self;
    
}
-(void)addContentView
{
    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.userInteractionEnabled = YES;
    [self addSubview:_headerImageView];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    
    
    _uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_uploadBtn setImage:[UIImage imageNamed:@"upload01"] forState:UIControlStateNormal];
    [_headerImageView addSubview:_uploadBtn];
    [_uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImageView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(_headerImageView.mas_bottom).offset(-10);
    }];
    
    _downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_downloadBtn setImage:[UIImage imageNamed:@"down01"] forState:UIControlStateNormal];
    [_headerImageView addSubview:_downloadBtn];
    [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_uploadBtn.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(_headerImageView.mas_bottom).offset(-10);
    }];
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteBtn setImage:[UIImage imageNamed:@"delete01"] forState:UIControlStateNormal];
    [_headerImageView addSubview:_deleteBtn];
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headerImageView.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(_headerImageView.mas_bottom).offset(-10);
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
