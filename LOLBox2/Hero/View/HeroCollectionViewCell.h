//
//  HeroCollectionViewCell.h
//  LOLBox2
//
//  Created by 范琦 on 15/8/26.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroFree;

@interface HeroCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *location;
@property (nonatomic, strong) HeroFree *heroFree;

@end
