//
//  MainView.m
//  LOLBox2
//
//  Created by 范琦 on 15/8/24.
//  Copyright (c) 2015年 范琦. All rights reserved.
//

#import "MainView.h"

@implementation MainView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.hero = [UIButton buttonWithType:UIButtonTypeCustom];
        self.hero.frame = CGRectMake(20, 0, frame.size.width / 4, frame.size.width / 4);
        [self addSubview:self.hero];
        [self.hero setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
        self.hero.layer.cornerRadius = 0.5;
        
        
        
        UILabel *heroL = [[UILabel alloc]initWithFrame:CGRectMake(0, self.hero.bounds.size.height * 3 / 4, self.hero.bounds.size.width, self.hero.bounds.size.height / 4)];
        heroL.text = @"英雄";
        heroL.textColor = [UIColor whiteColor];
        [self.hero addSubview:heroL];
        heroL.textAlignment = NSTextAlignmentCenter;
        heroL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        heroL.alpha = 0.8;
        
      
        self.equip = [UIButton buttonWithType:UIButtonTypeCustom];
        self.equip.frame = CGRectMake(frame.size.width - 20 - self.hero.bounds.size.width, 0, frame.size.width / 4, frame.size.width / 4);
        [self addSubview:self.equip];
        [self.equip setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
        
        UILabel *equipL = [[UILabel alloc]initWithFrame:CGRectMake(0, self.hero.bounds.size.height * 3 / 4, self.hero.bounds.size.width, self.hero.bounds.size.height / 4)];
        equipL.text = @"装备";
        equipL.textColor = [UIColor whiteColor];
        [self.equip addSubview:equipL];
        equipL.textAlignment = NSTextAlignmentCenter;
        equipL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        equipL.alpha = 0.8;
        
        self.information = [UIButton buttonWithType:UIButtonTypeCustom];
        self.information.frame = CGRectMake(frame.size.width / 2 - self.hero.bounds.size.width / 2, frame.size.height / 2.4, frame.size.width / 4, frame.size.width / 4);
        [self addSubview:self.information];
        [self.information setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
        
        UILabel *informationL = [[UILabel alloc]initWithFrame:CGRectMake(0, self.hero.bounds.size.height * 3 / 4, self.hero.bounds.size.width, self.hero.bounds.size.height / 4)];
        informationL.text = @"百科";
        informationL.textColor = [UIColor whiteColor];
        [self.information addSubview:informationL];
        informationL.textAlignment = NSTextAlignmentCenter;
        informationL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        informationL.alpha = 0.8;

        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            [UIView setAnimationRepeatAutoreverses:YES];
            [UIView setAnimationRepeatCount:NSIntegerMax];
            self.hero.transform = CGAffineTransformMakeRotation(M_PI / 6);
            self.equip.transform = CGAffineTransformMakeRotation(-M_PI / 6);
            self.information.transform = CGAffineTransformMakeRotation(-M_PI / 6);
        } completion:nil];

    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
