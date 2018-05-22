//
//  LoginTopView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "LoginTopView.h"

@interface LoginTopView ()


/** 背景  */
@property (nonatomic,strong) UIImageView *img_topImageBg;


/** logo  */
@property (nonatomic,strong) UIImageView *img_logo;


/** app名称  */
@property (nonatomic,strong) UILabel *lab_appName;


@end

@implementation LoginTopView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
    
    
}



/**
 c
 初始化布局
 */
- (void)setUpUI {
    
    _img_topImageBg = ({
        UIImageView *bgImage = [[UIImageView alloc]init];
        bgImage.image = [UIImage imageNamed:@"icon_loginHearder_bg"];
        [self addSubview:bgImage];
        bgImage;
        
    });
    
    
    _img_logo = ({
        UIImageView *logoImage = [[UIImageView alloc]init];
        logoImage.backgroundColor  = [UIColor yellowColor];
//        logoImage.image = [UIImage imageNamed:@"icon_loginHearder_bg"];
        [self.img_topImageBg addSubview:logoImage];
        logoImage;
    });
    
    
    _lab_appName = ({
        
        UILabel *applable = [[UILabel alloc]init];
        applable.font = FONT(17);
        applable.text = @"碑林区智慧大院";
        applable.textColor = [UIColor colorWithHexString:TextColor_ff];
        applable.textAlignment = NSTextAlignmentCenter;
        [self.img_topImageBg addSubview:applable];
        applable;
        
    });
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
 
    [self.img_topImageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.height.equalTo(self);
    }];
    
    [self.img_logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.img_topImageBg);
        make.top.equalTo(self.img_topImageBg.mas_top).offset(55);
        make.width.height.mas_equalTo(62);
    }];
    
    [self.lab_appName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.img_logo.mas_bottom).offset(18);
        make.height.mas_equalTo(17);
        make.centerX.equalTo(self.img_topImageBg);
    }];
    
    
}



@end
