//
//  MainViewController.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/24.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "HeroMainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MainView *main = [[MainView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT / 2, SCREENWEIGHT, SCREENHEIGHT / 2)];
    [self.view addSubview:main];
    
    [main.hero addTarget:self action:@selector(heroPush:) forControlEvents:UIControlEventTouchUpInside];
    [main.equip addTarget:self action:@selector(equipPush:) forControlEvents:UIControlEventTouchUpInside];
    [main.information addTarget:self action:@selector(informationPush:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)heroPush:(UIButton *)button
{
    HeroMainViewController *heroMain = [[HeroMainViewController alloc]init];
    [self.navigationController pushViewController:heroMain animated:YES];
    
}
- (void)equipPush:(UIButton *)button
{
    
}
- (void)informationPush:(UIButton *)button
{
    
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
