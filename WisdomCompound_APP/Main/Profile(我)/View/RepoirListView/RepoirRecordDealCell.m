//
//  RepoirRecordDealCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/26.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "RepoirRecordDealCell.h"


@interface RepoirRecordDealCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab_orderNo;
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirProjectTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_addressTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_addressContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirName;
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirPhone;
@property (weak, nonatomic) IBOutlet UILabel *lab_dealLong;

@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UIView *line2;

@property (weak, nonatomic) IBOutlet UILabel *lab_applyTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_applyTimeContent;
@property (weak, nonatomic) IBOutlet UIButton *btn_lookDetail;

- (IBAction)lookDetail:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn_evaluation;

- (IBAction)GoEvaluationAction:(UIButton *)sender;

@end

@implementation RepoirRecordDealCell


- (void)layoutSubviews {
    
    [super layoutSubviews];
    _lab_orderNo.textColor = _lab_dealLong.textColor = [UIColor colorWithHexString:TextColor_1E81D2];

    self.lab_applyTitle.textColor = self.lab_addressTitle.textColor  = self.lab_repoirName.textColor = self.lab_repoirPhone.textColor= [UIColor colorWithHexString:TextColor_66];
    self.lab_repoirContent.textColor = self.lab_addressContent.textColor = [UIColor colorWithHexString:TextColor_33];
    self.lab_applyTitle.textColor = self.lab_applyTimeContent.textColor = [UIColor colorWithHexString:TextColor_99];
    XBViewBorderRadius(_btn_evaluation, 12, 1, [UIColor colorWithHexString:TextColor_66]);
    XBViewBorderRadius(_btn_lookDetail, 12, 1, [UIColor colorWithHexString:TextColor_1E81D2]);
    [_btn_lookDetail setTitleColor:[UIColor colorWithHexString:TextColor_1E81D2] forState:UIControlStateNormal];
    self.line1.backgroundColor = self.line1.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
}


- (IBAction)lookDetail:(UIButton *)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectSeeDetail)]) {
        [_delegate selectSeeDetail];
    }
    
}
- (IBAction)GoEvaluationAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectGoEvaluation)]) {
        [_delegate selectGoEvaluation];
    }
}




- (void)setIsShowEvaluation:(BOOL)isShowEvaluation {
    
    if (isShowEvaluation) {
        self.btn_evaluation.hidden = NO;
    }else {
        self.btn_evaluation.hidden = YES;
    }
    
}



@end
