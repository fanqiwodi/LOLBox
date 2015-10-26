//
//  HeroMainViewController.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/24.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "HeroMainViewController.h"
#import "UIColor+AddColor.h"
#import "FreeHeroView.h"
#import "NetHandler.h"
#import "HeroFree.h"
#import "MYHeroView.h"
#import "AllHeroView.h"

@interface HeroMainViewController ()

@property (nonatomic, strong) FreeHeroView *freeView;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) MYHeroView *myHeroView;
@property (nonatomic, strong) AllHeroView *allHeroView;
@property (nonatomic, strong) NSMutableArray *allArr;
@end

@implementation HeroMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"周免英雄", @"我的英雄", @"全部英雄"]];
    [self.BackImageV addSubview:segment];
    segment.frame = CGRectMake(0, 0, SCREENWEIGHT, 30);
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor carrotColor];
    
    self.freeView = [[FreeHeroView alloc]initWithFrame:CGRectMake(0, 30, SCREENWEIGHT, self.BackImageV.bounds.size.height - 30)];
    [self.BackImageV addSubview:self.freeView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self freeHandles];
    });
    [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    
}

// 懒加载
- (MYHeroView *)myHeroView
{
    if (_myHeroView == nil) {
        self.myHeroView = [[MYHeroView alloc]initWithFrame:CGRectMake(0, 30, SCREENWEIGHT, self.BackImageV.bounds.size.height - 30)];
        [self.BackImageV addSubview:_myHeroView];
    }
    return _myHeroView;
}
- (AllHeroView *)allHeroView
{
    if (_allHeroView == nil) {
        self.allHeroView = [[AllHeroView alloc]initWithFrame:CGRectMake(0, 30, SCREENWEIGHT, self.BackImageV.bounds.size.height - 30)];
        [self.BackImageV addSubview:_allHeroView];
    }
    return _allHeroView;
}

// 周免英雄的网络请求
- (void)freeHandles
{
    self.arr = [NSMutableArray array];
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiHeroes.php?v=70&type=free&OSType=iOS8.1.2" completion:^(NSData *data) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *aa = [result objectForKey:@"free"];
        for (NSDictionary *dic in aa) {
            HeroFree *heroFree = [[HeroFree alloc]init];
            [heroFree setValuesForKeysWithDictionary:dic];
            [self.arr addObject:heroFree];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.freeView.arr = self.arr;
        });
    }];
}
// 全部英雄的网络请求
- (void)allHandles
{
    self.allArr = [NSMutableArray array];
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiHeroes.php?v=70&type=all&OSType=iOS8.1.2" completion:^(NSData *data) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *aa = [result objectForKey:@"all"];
        for (NSDictionary *dic in aa) {
            HeroFree *heroFree = [[HeroFree alloc]init];
            [heroFree setValuesForKeysWithDictionary:dic];
            [self.allArr addObject:heroFree];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.allHeroView.arr = self.allArr;
        });
    }];
}
- (void)segmentChange:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == 1) {
        [self.BackImageV bringSubviewToFront:self.myHeroView];
    }
    else if (seg.selectedSegmentIndex == 0){
        [self.BackImageV bringSubviewToFront:self.freeView];
    }
    else if (seg.selectedSegmentIndex == 2){
        [self.BackImageV bringSubviewToFront:self.allHeroView];
        if (self.allArr.count == 0) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                [self allHandles];
            });
        }
    }
    
    

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
