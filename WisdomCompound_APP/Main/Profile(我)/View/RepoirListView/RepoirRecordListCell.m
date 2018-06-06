//
//  RepoirRecordListCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "RepoirRecordListCell.h"


@interface RepoirRecordListCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirNo;
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirProjectTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_addressTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_applyTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_repoirContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_addressContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_applyTimeContent;

@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *btn_lookDetail;
- (IBAction)lookDetail:(UIButton *)sender;

@end

@implementation RepoirRecordListCell



- (void)layoutSubviews {

  [super layoutSubviews];
    _lab_repoirNo.textColor = [UIColor colorWithHexString:TextColor_1E81D2];
    self.lab_applyTitle.textColor = self.lab_addressTitle.textColor = [UIColor colorWithHexString:TextColor_66];
    self.lab_repoirContent.textColor = self.lab_addressContent.textColor = [UIColor colorWithHexString:TextColor_33];
    self.lab_applyTitle.textColor = self.lab_applyTimeContent.textColor = [UIColor colorWithHexString:TextColor_99];
    
    XBViewBorderRadius(_btn_lookDetail, 12, 1, [UIColor colorWithHexString:TextColor_1E81D2]);
    [_btn_lookDetail setTitleColor:[UIColor colorWithHexString:TextColor_1E81D2] forState:UIControlStateNormal];
    self.line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
}






- (IBAction)lookDetail:(UIButton *)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectNoDealRepoir)]) {
        [_delegate selectNoDealRepoir];
    }
    
}
@end
