//
//  FreeHeroView.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/26.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "FreeHeroView.h"
#import "HeroCollectionViewCell.h"

@interface FreeHeroView()<UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation FreeHeroView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(frame.size.width / 2 - 30, 60);
        flowLayout.minimumInteritemSpacing = 40;
        flowLayout.minimumLineSpacing = 20;
        
        self.collect = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 0, frame.size.width - 20, frame.size.height) collectionViewLayout:flowLayout];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
