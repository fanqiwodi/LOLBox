//
//  AllHeroView.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/27.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "AllHeroView.h"
#import "UIColor+AddColor.h"
#import "HeroCollectionViewCell.h"


@interface AllHeroView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collect;

@end
@implementation AllHeroView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.searchLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width / 9, 5, frame.size.width / 7, 20)];
        [self addSubview:_searchLabel];
        self.searchLabel.text = @"搜索";
        self.searchLabel.textColor = [UIColor whiteColor];
        
        self.textF = [[UITextField alloc]initWithFrame:CGRectMake(self.searchLabel.frame.origin.x + self.searchLabel.bounds.size.width, 5, frame.size.width / 2, 20)];
        [self addSubview:_textF];
        self.textF.borderStyle = UITextBorderStyleRoundedRect;
        
        self.search = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.search.frame = CGRectMake(self.textF.frame.origin.x + self.textF.bounds.size.width + 15, 5, frame.size.width / 7, 20);
        [self addSubview:_search];
        [self.search setTitle:@"搜索" forState:UIControlStateNormal];
        self.search.tintColor = [UIColor carrotColor];
        self.search.titleLabel.font = [UIFont systemFontOfSize:17];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(frame.size.width / 2 - 30, 60);
        flowLayout.minimumInteritemSpacing = 40;
        flowLayout.minimumLineSpacing = 20;
        
        self.collect = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 30, frame.size.width - 20, frame.size.height - 30) collectionViewLayout:flowLayout];
        [self addSubview:self.collect];
        self.collect.backgroundColor = [UIColor clearColor];
        [self.collect registerClass:[HeroCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        self.collect.delegate = self;
        self.collect.dataSource = self;

        
    }
    return self;
}
- (void)setArr:(NSMutableArray *)arr
{
    _arr = [NSMutableArray arrayWithArray:arr];
    [self.collect reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    HeroFree *heroFree = [self.arr objectAtIndex:indexPath.row];
    cell.heroFree = heroFree;
    return cell;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.textF resignFirstResponder];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
