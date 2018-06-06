//
//  MeetEvaluationController.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/2.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"

@interface MeetEvaluationController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *lab_meetNo;
@property (weak, nonatomic) IBOutlet UILabel *lab_status;

@property (weak, nonatomic) IBOutlet UILabel *lab_mainTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_subTitle;

@property (weak, nonatomic) IBOutlet UIView *bg_consultStarView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetDecorateStarView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetWelcomeStarView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetInstructionsSatrView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetEquipmentStarView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetTeaStarView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetHealthStarView;
@property (weak, nonatomic) IBOutlet UIView *bg_meetSendPennStarView;

@property (weak, nonatomic) IBOutlet UITextView *tv_memo;

@property (weak, nonatomic) IBOutlet UILabel *lab_title1;
@property (weak, nonatomic) IBOutlet UILabel *lab_title2;
@property (weak, nonatomic) IBOutlet UILabel *lab_title3;
@property (weak, nonatomic) IBOutlet UILabel *lab_title4;
@property (weak, nonatomic) IBOutlet UILabel *lab_title5;
@property (weak, nonatomic) IBOutlet UILabel *lab_title6;
@property (weak, nonatomic) IBOutlet UILabel *lab_title7;
@property (weak, nonatomic) IBOutlet UILabel *lab_title8;

@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle1;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle2;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle3;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle4;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle5;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle6;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle7;
@property (weak, nonatomic) IBOutlet UILabel *lab_starTitle8;

@property (weak, nonatomic) IBOutlet UIButton *btn_commit;
- (IBAction)commitAction:(UIButton *)sender;

@end
