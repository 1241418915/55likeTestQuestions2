//
//  ViewController.m
//  55likeTestQuestions2
//
//  Created by junseek on 2017/3/2.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "ViewController.h"
#import "FullScreenImageCell.h"
#import "SingleImageCell.h"
#import "TextCell.h"
#import "MyOwnFooterView.h"
#import "DataModel.h"
#import "GetHeight.h"
#import "ShowCammera.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
{
    UITableView * _tableView;
    MyOwnFooterView * footer;
    
}
@property (nonatomic,strong) NSMutableArray * dataModelArray;
@property (nonatomic,strong)NSMutableArray * heightArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"自定义";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataModelArray = [NSMutableArray array];
    DataModel * model1 = [DataModel getModelWithDict:@{@"type":@"0",@"content":@"按时打卡上搭上了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收到啦看到卡拉斯打了卡的数量开始大路口",@"image":[UIImage imageNamed:@"默认图片"]}];
    DataModel * model2 = [DataModel getModelWithDict:@{@"type":@"1",@"content":@"",@"image":[UIImage imageNamed:@"默认图片"]}];
    DataModel * model3 = [DataModel getModelWithDict:@{@"type":@"2",@"content":@"按时打卡上搭上了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大",@"image":[UIImage imageNamed:@"默认图片"]}];
    
    [_dataModelArray addObject:model1];
    [_dataModelArray addObject:model2];
    [_dataModelArray addObject:model3];

    // 记录行高
    [self saveHeight];
    
    [self addRightBtn];
    //添加tableview
    [self addTableView];
    
}
-(void)addRightBtn
{
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClick)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark      保存 cell 高度
-(void)saveBtnClick
{
    [_tableView reloadData];
}
-(void)saveHeight
{
    
    _heightArray = [NSMutableArray array];
    for (int i = 0; i < _dataModelArray.count; i ++)
    {
        DataModel * model = _dataModelArray[i];
        CGFloat textHeight = [GetHeight getHeightWithLimitSize:CGSizeMake(SCREEN_Width - 20, MAXFLOAT) Content:model.content font:[UIFont systemFontOfSize:16]];
        [_heightArray addObject:[NSString stringWithFormat:@"%f",textHeight]];
    }
}

-(void)addTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [self getTableViewFooterView];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataModelArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel * model = _dataModelArray[indexPath.row];
    if (model.type == 0)
    {
        return MAX([_heightArray[indexPath.row] floatValue], 20) +40 +10;
    }
    else if (model.type == 1)
    {
        
        
        return SCREEN_Width/2 +10;
    }
    else
    {
        return 150;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel * model = _dataModelArray[indexPath.row];
    
    //    type   : 0    1  2
    if (model.type == 0)
    {
        //文字
        NSString * identify1 = @"cell1";
        TextCell * cell = [tableView dequeueReusableCellWithIdentifier:identify1];
        if (cell == nil)
        {
            cell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentTextView.text = model.content;
//        [self addDownKeyboard:cell.contentTextView];
        cell.contentTextView.tag = indexPath.row;
        cell.contentTextView.delegate = self;
        return cell;
    }
    else if (model.type == 1)
    {
        // 图片
        NSString * identify2 = @"cell2";
        FullScreenImageCell * cell = [tableView dequeueReusableCellWithIdentifier:identify2];
        if (cell == nil)
        {
            cell = [[FullScreenImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify2];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (model.image)
        {
            cell.headerImageView.image = model.image;
        }
        
        
        return cell;
    }
    else
    {
        // 图文
        NSString * identify3 = @"cell3";
        SingleImageCell * cell = [tableView dequeueReusableCellWithIdentifier:identify3];
        if (cell == nil)
        {
            cell = [[SingleImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify3];
        }
        cell.headerImageView.backgroundColor = [UIColor colorWithRed:79/255.0 green:137/255.0 blue:230/255.0 alpha:1];
        cell.contentLabel.text = model.content;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
// 检测textview 字符变化
- (void)textViewDidChange:(UITextView *)textView

{
        DataModel * model = _dataModelArray[textView.tag];
        model.content = textView.text;
    
    CGFloat textHeight = [GetHeight getHeightWithLimitSize:CGSizeMake(SCREEN_Width - 20, MAXFLOAT) Content:model.content font:[UIFont systemFontOfSize:16]];
    [_heightArray replaceObjectAtIndex:textView.tag withObject:[NSString stringWithFormat:@"%f",textHeight]];
    NSLog(@"%@",_heightArray);
    
    
}
#pragma mark  footerview
-(UIView *)getTableViewFooterView
{
    footer = [[MyOwnFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Width * 4/27 + 15 +70)];
    [footer.textEditBtn addTarget:self action:@selector(addTextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footer.photoBtn addTarget:self action:@selector(photoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footer.htmlBtn addTarget:self action:@selector(htmlBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footer.QRCodeBtn addTarget:self action:@selector(QRCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footer.shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footer.privateBtn addTarget:self action:@selector(privateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    return footer;
}
#pragma mark  底部四个按钮 方法
-(void)addTextBtnClick
{
    NSDictionary * dict = @{@"type":@"0",@"content":@"按时打卡上搭上了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收到啦看到卡拉斯打了卡的数量开始大路口",@"image":[UIImage imageNamed:@"默认图片"]};
    [self addModelWithDict:dict];
}
-(void)photoBtnClick
{

    
    [[ShowCammera shareCamemra] show];
    [ShowCammera shareCamemra].selectImageblock = ^(UIImage *image) {
        NSDictionary * dict = @{@"type":@"1",@"content":@"",@"image":image};
            [self addModelWithDict:dict];
    };
}
-(void)htmlBtnClick
{
    NSDictionary * dict = @{@"type":@"2",@"content":@"按时打卡上搭上了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大",@"image":[UIImage imageNamed:@"默认图片"]};
    [self addModelWithDict:dict];
}
-(void)QRCodeBtnClick
{
    NSDictionary * dict = @{@"type":@"2",@"content":@"按时打卡上搭上了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大快速大量收了大数量扩大宽松大",@"image":[UIImage imageNamed:@"默认图片"]};
    [self addModelWithDict:dict];
}

-(void)addModelWithDict:(NSDictionary *)dict
{
    DataModel * model = [DataModel getModelWithDict:dict];
    [_dataModelArray addObject:model];
    
    CGFloat textHeight = [GetHeight getHeightWithLimitSize:CGSizeMake(SCREEN_Width - 20, MAXFLOAT) Content:model.content font:[UIFont systemFontOfSize:16]];
    [_heightArray addObject:[NSString stringWithFormat:@"%f",textHeight]];
    
    [_tableView reloadData];
}
#pragma mark  选择共享 和 私密
-(void)shareBtnClick
{
    [footer.shareBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [footer.shareBtn setTitleColor:[UIColor colorWithRed:112/255.0 green:191/255.0 blue:232/255.0 alpha:1] forState:UIControlStateNormal];
    [footer.privateBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [footer.privateBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}
-(void)privateBtnClick
{
    [footer.shareBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [footer.shareBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [footer.privateBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [footer.privateBtn setTitleColor:[UIColor colorWithRed:112/255.0 green:191/255.0 blue:232/255.0 alpha:1] forState:UIControlStateNormal];

}
//#pragma mark -添加收起键盘方法，有特殊需求，重写此方法
//- (void)addDownKeyboard:(id)sender
//{
//    if ([sender isKindOfClass:[UITextField class]]
//        || [sender isKindOfClass:[UITextView class]]
//        || [sender isKindOfClass:[UISearchBar class]]) {
//
//        // 给textfield添加一个收起键盘的按钮
//        UIToolbar *kbToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, 40)];
//
//        UIBarButtonItem *btnSpace   = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                                                    target:self
//                                                                                    action:nil];
//        UIBarButtonItem *doneBtn    = [[UIBarButtonItem alloc] initWithTitle:@"收起键盘"
//                                                                       style:UIBarButtonItemStyleDone
//                                                                      target:self
//                                                                      action:@selector(dismissKeyBoard)];
//        [doneBtn setTintColor:[UIColor colorWithRed:112/255.0 green:191/255.0 blue:232/255.0 alpha:1]];
//        NSArray *btnArray = [NSArray arrayWithObjects:btnSpace, doneBtn, nil];
//        [kbToolbar setItems:btnArray];
//        [kbToolbar setBarStyle:UIBarStyleDefault];
//
//        [sender setInputAccessoryView:kbToolbar];
//    }
//    else
//    {
//        NSLog(@"传入的输入框类型错误:%@", sender);
//    }
//}
//
//- (void)dismissKeyBoard
//{
//    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//    [self.view endEditing:YES];
//    [self.navigationController.view endEditing:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
