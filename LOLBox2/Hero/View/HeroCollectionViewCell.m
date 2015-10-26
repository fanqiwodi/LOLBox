//
//  HeroCollectionViewCell.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/26.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "HeroCollectionViewCell.h"
#import "HeroFree.h"
#import "UIImageView+WebCache.h"

@implementation HeroCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width / 3 + 10, frame.size.height)];
        [self.contentView addSubview:_imageV];
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(self.imageV.bounds.size.width + 10, 0, frame.size.width - self.imageV.bounds.size.width, frame.size.height / 3)];
        [self.contentView addSubview:_title];
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(self.title.frame.origin.x, self.title.bounds.size.height, self.title.bounds.size.width, self.title.bounds.size.height)];
        [self.contentView addSubview:_name];
        self.location = [[UILabel alloc]initWithFrame:CGRectMake(self.title.frame.origin.x, self.name.frame.origin.y + self.name.bounds.size.height, self.title.bounds.size.width, self.title.bounds.size.height)];
        [self.contentView addSubview:_location];
    }
    return self;
}



- (void)setHeroFree:(HeroFree *)heroFree
{
    _heroFree = heroFree;
    self.title.text = self.heroFree.title;
    self.title.font = [UIFont systemFontOfSize:14];
    self.title.textColor = [UIColor whiteColor];
    self.name.font = [UIFont systemFontOfSize:13];
    self.name.textColor = [UIColor whiteColor];
    self.location.font = [UIFont systemFontOfSize:13];
    self.location.textColor = [UIColor cyanColor];
    self.name.text = self.heroFree.cnName;
    self.location.text = self.heroFree.location;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", self.heroFree.enName]] placeholderImage:nil];
}

@end
