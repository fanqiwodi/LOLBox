//
//  Base2ViewController.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/24.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "Base2ViewController.h"
#import "UIColor+AddColor.h"

@interface Base2ViewController ()

@end

@implementation Base2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.TopImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWEIGHT, SCREENHEIGHT / 8)];
    self.TopImageV.image = [UIImage imageNamed:@"main.jpg"];
    [self.view addSubview:self.TopImageV];
    self.TopImageV.userInteractionEnabled = YES;
    
    self.BackImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT / 8, SCREENWEIGHT, SCREENHEIGHT * 7 / 8)];
    self.BackImageV.image = [UIImage imageNamed:@"huise.jpg"];
    [self.view addSubview:self.BackImageV];
    self.BackImageV.userInteractionEnabled = YES;
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(10, self.TopImageV.bounds.size.height  * 2 / 3 - 10, 40, 25);
    [self.backButton setImage:[UIImage imageNamed:@"small.png"] forState:UIControlStateNormal];
    [self.TopImageV addSubview:self.backButton];
    self.backButton.tintColor = [UIColor carrotColor];
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
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
