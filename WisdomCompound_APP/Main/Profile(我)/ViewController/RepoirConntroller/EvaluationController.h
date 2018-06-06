//
//  EvaluationController.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/31.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"

@interface EvaluationController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *StarBgView1;
@property (weak, nonatomic) IBOutlet UIView *starBgView2;
@property (weak, nonatomic) IBOutlet UIView *starBgView3;
@property (weak, nonatomic) IBOutlet UITextView *tv_memo;
@property (weak, nonatomic) IBOutlet UILabel *lab_serialNumber;
@property (weak, nonatomic) IBOutlet UILabel *lab_statues;
@property (weak, nonatomic) IBOutlet UILabel *title1;

@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *starTitle1;
@property (weak, nonatomic) IBOutlet UILabel *starTitle2;
@property (weak, nonatomic) IBOutlet UILabel *starTitle3;
@property (weak, nonatomic) IBOutlet UILabel *starEvluaTitle1;
@property (weak, nonatomic) IBOutlet UILabel *starEvluaTitle2;
@property (weak, nonatomic) IBOutlet UILabel *starEvluaTitle3;

@property (weak, nonatomic) IBOutlet UIButton *btn_commit;
- (IBAction)commitAction:(UIButton *)sender;

@end
