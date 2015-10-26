//
//  BaseViewController.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/24.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.TopImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWEIGHT, SCREENHEIGHT /2)];
    self.TopImageV.image = [UIImage imageNamed:@"main2.jpg"];
    [self.view addSubview:_TopImageV];

    self.BackImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT / 2, SCREENWEIGHT, SCREENHEIGHT / 2)];
    self.BackImageV.image = [UIImage imageNamed:@"huise.jpg"];
    [self.view addSubview:self.BackImageV];
    
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
