//
//  MeetingApplyController.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/28.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"

@interface MeetingApplyController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *mark1;
@property (weak, nonatomic) IBOutlet UILabel *mark2;
@property (weak, nonatomic) IBOutlet UILabel *mark3;
@property (weak, nonatomic) IBOutlet UILabel *mark4;
@property (weak, nonatomic) IBOutlet UILabel *mark5;
@property (weak, nonatomic) IBOutlet UILabel *mark6;
@property (weak, nonatomic) IBOutlet UILabel *mark7;

@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *title2;
@property (weak, nonatomic) IBOutlet UILabel *title3;
@property (weak, nonatomic) IBOutlet UILabel *title4;
@property (weak, nonatomic) IBOutlet UILabel *title5;
@property (weak, nonatomic) IBOutlet UILabel *title6;
@property (weak, nonatomic) IBOutlet UILabel *title7;
@property (weak, nonatomic) IBOutlet UILabel *title8;
@property (weak, nonatomic) IBOutlet UILabel *title9;
@property (weak, nonatomic) IBOutlet UILabel *title10;
@property (weak, nonatomic) IBOutlet UILabel *title11;

@property (weak, nonatomic) IBOutlet UIView *bg_projection;
@property (weak, nonatomic) IBOutlet UIView *bg_podium;


//承办单位
@property (weak, nonatomic) IBOutlet UITextField *tv_undertakeUnit;
@property (weak, nonatomic) IBOutlet UITextField *tv_attendance;
@property (weak, nonatomic) IBOutlet UITextField *tv_attendingUnit;
@property (weak, nonatomic) IBOutlet UITextField *tv_startTime;
@property (weak, nonatomic) IBOutlet UITextField *tv_endTime;
@property (weak, nonatomic) IBOutlet UIButton *btn_unUseProjection;
@property (weak, nonatomic) IBOutlet UIButton *btn_useProjection;
@property (weak, nonatomic) IBOutlet UIButton *btn_usePodium;
@property (weak, nonatomic) IBOutlet UIButton *btn_unUsePodium;
@property (weak, nonatomic) IBOutlet UITextField *tf_table;
@property (weak, nonatomic) IBOutlet UITextField *tf_chair;

@end
