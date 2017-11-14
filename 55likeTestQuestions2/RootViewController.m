//
//  RootViewController.m
//  55likeTestQuestions2
//
//  Created by 子非鱼 on 2017/11/13.
//  Copyright © 2017年 55like lj. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationBarStyle];
}
- (void)setNavgationBarStyle{
    
    
    [UILabel appearance].minimumScaleFactor = 0.5;
    //    设置导航栏的标题的字体、颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:17]};
    //    设置导航栏的tint颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:104/255.0 green:179/255.0 blue:230/255.0 alpha:1]];
    
    
       self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
