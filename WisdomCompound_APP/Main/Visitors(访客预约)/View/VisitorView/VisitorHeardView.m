//
//  VisitorHeardView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "VisitorHeardView.h"

@interface VisitorHeardView ()


/** 用户名  */
@property (nonatomic,strong) UILabel *lab_userName;

/** 科室  */
@property (nonatomic,strong) UILabel *lab_department;

/** 手机号  */
@property (nonatomic,strong) UILabel *lab_phone;

/** 历史预约  */
@property (nonatomic,strong) UIButton *btn_history;



@end

@implementation VisitorHeardView


- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
        [self setUpUI];
    }
    return self;
    
    
}


- (void)historyAction {
    
}


/**
 c
 初始化布局
 */
- (void)setUpUI {
    
    _lab_userName = ({
        
        UILabel *namelable = [[UILabel alloc]init];
        namelable.font = FONT(15);
        namelable.text = @"欧阳娜娜";
        namelable.textColor = [UIColor colorWithHexString:TextColor_ff];
        [self addSubview:namelable];
        namelable;
        
    });
    
    
    _lab_department = ({
        
        UILabel *departmentlable = [[UILabel alloc]init];
        departmentlable.font = FONT(11);
        departmentlable.text = @"车管科";
        departmentlable.textAlignment = NSTextAlignmentCenter;
        departmentlable.backgroundColor = [UIColor colorWithHexString:BtnBgColor_FFC600];
        departmentlable.textColor = [UIColor colorWithHexString:TextColor_ff];
        
        XBViewBorderRadius(departmentlable, 9, 0, [UIColor clearColor]);
        [self addSubview:departmentlable];
        departmentlable;
        
    });
    
    
    _lab_phone = ({
        
        UILabel *phonelable = [[UILabel alloc]init];
        phonelable.font = FONT(13);
        phonelable.text = @"18710627862";
        phonelable.textColor = [UIColor colorWithHexString:TextColor_ff];
        [self addSubview:phonelable];
        phonelable;
        
    });
    
    _btn_history = ({
        UIButton *historyBtn = [[UIButton alloc]init];
        historyBtn.titleLabel.font = FONT(11);
        [historyBtn setTitleColor:[UIColor colorWithHexString:TextColor_ff] forState:UIControlStateNormal];
        [historyBtn setTitle:@"历史预约" forState:UIControlStateNormal];
        [historyBtn setImage:[UIImage imageNamed:@"iocn_history"] forState:UIControlStateNormal];
        historyBtn.backgroundColor = [UIColor colorWithHexString:MainBlueColor];;
        [historyBtn addTarget:self action:@selector(historyAction)];
        [historyBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:3];
        [self addSubview:historyBtn];
        historyBtn;
    });
    
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.lab_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(self).offset(16);
        make.height.mas_equalTo(15);

    }];
    
    [self.lab_department mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lab_userName);
        make.height.mas_equalTo(17);
        make.left.equalTo(self.lab_userName.mas_right).offset(7);
        make.width.mas_equalTo(48);
    }];
    
    [self.lab_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab_userName.mas_bottom).offset(14);
        make.left.equalTo(self.lab_userName);
        make.height.mas_equalTo(10);
    }];
    
    [self.btn_history mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-14);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.lab_department);
    }];
    
    
}



@end
