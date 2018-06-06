//
//  MineHeaderView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *img_memberAvator;
@property (weak, nonatomic) IBOutlet UILabel *lab_memberNick;
@property (weak, nonatomic) IBOutlet UILabel *lab_department;
@property (weak, nonatomic) IBOutlet UILabel *lab_memberPhone;

@property (weak, nonatomic) IBOutlet UIButton *btn_visitorRecord;
@property (weak, nonatomic) IBOutlet UIButton *btn_repoirRecord;
@property (weak, nonatomic) IBOutlet UIButton *btn_userCarRecord;
@property (weak, nonatomic) IBOutlet UIButton *btn_meetRecord;


@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UIView *line2;
@property (weak, nonatomic) IBOutlet UIView *line3;

@end


@implementation MineHeaderView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]lastObject];
        [self headViewWithButton];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    XBViewBorderRadius(_img_memberAvator, 29, 0, [UIColor clearColor]);
    _line1.backgroundColor = _line2.backgroundColor = _line3.backgroundColor = [UIColor colorWithHexString:@"#E8E8E8"];
    _lab_department.textColor = [UIColor colorWithHexString:TextColor_33];
    XBViewBorderRadius(_lab_department, 9, 0, [UIColor clearColor]);
    _lab_department.backgroundColor = [UIColor colorWithHexString:LabBGColor_FFC500];
    _lab_memberPhone.textColor = [UIColor colorWithHexString:TextColor_66];
    _lab_department.textColor = [UIColor colorWithHexString:TextColor_ff];
    
    
}


- (void)headViewWithButton {
    
    [_btn_visitorRecord setImage:[UIImage imageNamed:@"icon_mine_vistor"] forState:UIControlStateNormal];
    [_btn_visitorRecord setTitle:@"访客预约" forState:UIControlStateNormal];
    [_btn_visitorRecord setTitleColor:[UIColor colorWithHexString:TextColor_66] forState:UIControlStateNormal];
    _btn_visitorRecord.tag = 11;
    _btn_visitorRecord.titleLabel.font = FONT(12);
    [_btn_visitorRecord layoutButtonWithEdgeInsetsStyle:0 imageTitleSpace:12];
    
    
    [_btn_repoirRecord setImage:[UIImage imageNamed:@"icon_mine_repair"] forState:UIControlStateNormal];
    [_btn_repoirRecord setTitle:@"报修记录" forState:UIControlStateNormal];
    [_btn_repoirRecord setTitleColor:[UIColor colorWithHexString:TextColor_66] forState:UIControlStateNormal];
    _btn_repoirRecord.tag = 12;
    _btn_repoirRecord.titleLabel.font = FONT(12);
    [_btn_repoirRecord layoutButtonWithEdgeInsetsStyle:0 imageTitleSpace:12];
    
    
    [_btn_userCarRecord setImage:[UIImage imageNamed:@"icon_mine_userCar"] forState:UIControlStateNormal];
    [_btn_userCarRecord setTitle:@"用车记录" forState:UIControlStateNormal];
    [_btn_userCarRecord setTitleColor:[UIColor colorWithHexString:TextColor_66] forState:UIControlStateNormal];
    _btn_userCarRecord.tag = 13;
    _btn_userCarRecord.titleLabel.font = FONT(12);
    [_btn_userCarRecord layoutButtonWithEdgeInsetsStyle:0 imageTitleSpace:12];
    
    
    [_btn_meetRecord setImage:[UIImage imageNamed:@"icon_mine_meetRecord"] forState:UIControlStateNormal];
    [_btn_meetRecord setTitle:@"会议记录" forState:UIControlStateNormal];
    [_btn_meetRecord setTitleColor:[UIColor colorWithHexString:TextColor_66] forState:UIControlStateNormal];
    _btn_meetRecord.tag = 14;
    _btn_meetRecord.titleLabel.font = FONT(12);
    [_btn_meetRecord layoutButtonWithEdgeInsetsStyle:0 imageTitleSpace:12];
    
    
    [_btn_visitorRecord addTarget:self action:@selector(mineHeadViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn_repoirRecord addTarget:self action:@selector(mineHeadViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn_userCarRecord addTarget:self action:@selector(mineHeadViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn_meetRecord addTarget:self action:@selector(mineHeadViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)mineHeadViewAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectHeadViewWithTag:)]) {
        [_delegate selectHeadViewWithTag:sender.tag];
    }
    
}



@end
