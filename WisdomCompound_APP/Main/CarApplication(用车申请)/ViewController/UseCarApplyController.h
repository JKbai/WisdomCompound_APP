//
//  UseCarApplyController.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/30.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"

@interface UseCarApplyController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *mark1;
@property (weak, nonatomic) IBOutlet UILabel *mark2;
@property (weak, nonatomic) IBOutlet UILabel *mark3;
@property (weak, nonatomic) IBOutlet UILabel *mark4;
@property (weak, nonatomic) IBOutlet UILabel *mark5;
@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *title2;
@property (weak, nonatomic) IBOutlet UILabel *title3;
@property (weak, nonatomic) IBOutlet UILabel *title4;
@property (weak, nonatomic) IBOutlet UILabel *title5;
@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UIView *line2;
@property (weak, nonatomic) IBOutlet UIView *line3;
@property (weak, nonatomic) IBOutlet UIView *line4;
@property (weak, nonatomic) IBOutlet UIView *line5;

@property (weak, nonatomic) IBOutlet UITextField *tf_useCarCompany;
@property (weak, nonatomic) IBOutlet UITextField *tf_useCarReason;
@property (weak, nonatomic) IBOutlet UITextField *tf_carPlatNo;
@property (weak, nonatomic) IBOutlet UITextField *tf_startTime;
@property (weak, nonatomic) IBOutlet UITextField *tf_endTime;
@property (weak, nonatomic) IBOutlet UITextView *tv_memo;

@end
