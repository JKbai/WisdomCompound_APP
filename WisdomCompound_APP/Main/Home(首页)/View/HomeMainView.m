//
//  HomeMainView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "HomeMainView.h"
#define ACTIVITY_WIDTH 97
@implementation HomeMainView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}


- (void)setUpUI {
    
    NSArray *imageArr = @[@"icon_home_vistor", @"icon_home_repair", @"icon_home_car", @"icon_home_meeting", @"icon_home_food", @"icon_home_news"];
    NSArray *titleArr = @[@"访客预约", @"报修反馈", @"用车申请", @"会议申请", @"智慧餐厅", @"新闻资讯"];
    
     CGFloat btn_offset = (SCREEN_WIDTH - 3*ACTIVITY_WIDTH) / 4;
    for (int i = 0; i < 6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat btn_x;
        CGFloat btn_y;
        if (i < 3) {
            btn_x =btn_offset+(i*(btn_offset+ACTIVITY_WIDTH));
            btn_y = 25;
        }else {
            btn_x = btn_offset+((i-3)*(btn_offset+ACTIVITY_WIDTH));
            btn_y = 163;
        }
        button.frame = CGRectMake(btn_x, btn_y, ACTIVITY_WIDTH, ACTIVITY_WIDTH);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = i;
        [button setTitleColor:[UIColor colorWithHexString:TextColor_66] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButtonAcion:) forControlEvents:UIControlEventTouchUpInside];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:0];
        [self addSubview:button];
      
    }
    
    
}

- (void)clickButtonAcion:(UIButton *)sender {
    self.homeMoudleType = sender.tag;
    if (_delegate && [_delegate respondsToSelector:@selector(selectHomeMoudleType:)]) {
        [_delegate selectHomeMoudleType:self.homeMoudleType];
    }
    
    
}


@end
