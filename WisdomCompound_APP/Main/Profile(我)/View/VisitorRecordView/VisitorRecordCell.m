//
//  VisitorRecordCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "VisitorRecordCell.h"


@interface VisitorRecordCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab_vistorName;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorPhone;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *lab_idCardTitle;

@property (weak, nonatomic) IBOutlet UILabel *lab_idCardContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorTimeTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorTimeContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorReasonTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorNumberTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorCarNoTitle;

@property (weak, nonatomic) IBOutlet UILabel *lab_visitorReasonContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorNumberContent;
@property (weak, nonatomic) IBOutlet UILabel *lab_visitorCarNoContent;



@end

@implementation VisitorRecordCell



- (void)setVisitorListModel:(VisitorListModel *)visitorListModel {
    
    self.lab_vistorName.text =  visitorListModel.visitorName;
    self.lab_visitorPhone.text = visitorListModel.visitorPhone;
    
    self.lab_idCardContent.text = visitorListModel.visitorIdCard;
    self.lab_visitorTimeContent.text = visitorListModel.visitTime;
    self.lab_visitorNumberContent.text = [NSString stringWithFormat:@"%@人",visitorListModel.visitorNum];
    self.lab_visitorReasonContent.text = visitorListModel.visitReason;
    self.lab_visitorCarNoContent.text = visitorListModel.carPlateNo;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _lab_vistorName.textColor = _lab_visitorTimeContent.textColor = _lab_visitorNumberContent.textColor = _lab_idCardContent.textColor = _lab_visitorReasonContent.textColor = _lab_visitorCarNoContent.textColor = [UIColor colorWithHexString:TextColor_33];
    
    
    _lab_visitorPhone.textColor = _lab_idCardTitle.textColor = _lab_visitorTimeTitle.textColor = _lab_visitorReasonTitle.textColor =_lab_visitorCarNoTitle.textColor = _lab_visitorNumberTitle.textColor=[UIColor colorWithHexString:TextColor_99];
    _line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
