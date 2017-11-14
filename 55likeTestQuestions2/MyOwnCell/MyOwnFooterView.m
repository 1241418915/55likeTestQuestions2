//
//  MyOwnFooterView.m
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "MyOwnFooterView.h"

@implementation MyOwnFooterView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        [self addContent];
    }
    return self;
}
-(void)addContent
{
    
    NSArray * namearray = @[@"text",@"camera",@"html",@"QRcode"];
    for (int i = 0; i < 4; i ++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:namearray[i]] forState:UIControlStateNormal];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10 + (SCREEN_Width *4/27+5) * i);
            make.top.equalTo(self.mas_top).offset(15);
            make.size.mas_equalTo(CGSizeMake(SCREEN_Width *4/27, SCREEN_Width *4/27));
        }];

        switch (i) {
            case 0:
                _textEditBtn = btn;
                break;
            case 1:
                _photoBtn = btn;
                break;
            case 2:
                _htmlBtn = btn;
                break;
            case 3:
                _QRCodeBtn = btn;
                break;

            default:
                break;
        }
    }
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_shareBtn setTitle:@"共享" forState:UIControlStateNormal];
    [_shareBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [_shareBtn setTitleColor:[UIColor colorWithRed:112/255.0 green:191/255.0 blue:232/255.0 alpha:1] forState:UIControlStateNormal];
    
    _shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 , 0, 5);
    _shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 , 0, -5);
    
    [self addSubview:_shareBtn];
    [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(65, 40));
        make.top.equalTo(self).mas_offset(30 + SCREEN_Width * 4/27);
    }];
    
    _privateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_privateBtn setTitle:@"私密" forState:UIControlStateNormal];
    [_privateBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [_privateBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    _privateBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 , 0, 5);
    _privateBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 , 0, -5);
    
    [self addSubview:_privateBtn];
    [_privateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shareBtn.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(65, 40));
        make.top.equalTo(self).mas_offset(30 + SCREEN_Width * 4/27);
    }];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
