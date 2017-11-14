//
//  SingleImageCell.m
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "SingleImageCell.h"

@implementation SingleImageCell
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
    UIView * bottomView= [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bottomView.layer.borderWidth = .5;
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
    }];
    
    _headerImageView = [[UIImageView alloc] init];
    
    [bottomView addSubview:_headerImageView];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(16);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:15];
    [bottomView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImageView.mas_right).offset(10);
        make.top.bottom.equalTo(_headerImageView);
        make.right.equalTo(bottomView.mas_right).offset(-10);
    }];
    
    _uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_uploadBtn setImage:[UIImage imageNamed:@"upload01"] forState:UIControlStateNormal];
    [bottomView addSubview:_uploadBtn];
    [_uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerImageView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(bottomView.mas_bottom).offset(-10);
    }];
    
    _downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_downloadBtn setImage:[UIImage imageNamed:@"down01"] forState:UIControlStateNormal];
    [bottomView addSubview:_downloadBtn];
    [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_uploadBtn.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(bottomView.mas_bottom).offset(-10);
    }];
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteBtn setImage:[UIImage imageNamed:@"delete01"] forState:UIControlStateNormal];
    [bottomView addSubview:_deleteBtn];
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bottomView.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(bottomView.mas_bottom).offset(-10);
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
