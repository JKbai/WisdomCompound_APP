//
//  UserCarRecordCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UserCarRecordCell.h"

@interface UserCarRecordCell ()
@property (weak, nonatomic) IBOutlet UIView *view_bgCar;

@property (weak, nonatomic) IBOutlet UILabel *lab_orderNo;
@property (weak, nonatomic) IBOutlet UIImageView *img_carPhoto;

@property (weak, nonatomic) IBOutlet UILabel *lab_carBrand;
@property (weak, nonatomic) IBOutlet UILabel *lab_carType;
@property (weak, nonatomic) IBOutlet UILabel *lab_carYear;
@property (weak, nonatomic) IBOutlet UILabel *lab_carDisplacement;
@property (weak, nonatomic) IBOutlet UILabel *lab_carGear;
@property (weak, nonatomic) IBOutlet UILabel *lab_carSeat;
@property (weak, nonatomic) IBOutlet UILabel *lab_carPlatNo;
@property (weak, nonatomic) IBOutlet UILabel *lab_carApplyTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_carApplyTime;
@property (weak, nonatomic) IBOutlet UIButton *btn_lookDetail;
- (IBAction)lookDetailAction:(UIButton *)sender;

@end

@implementation UserCarRecordCell



- (void)layoutSubviews {
    
    [super layoutSubviews];
    _view_bgCar.backgroundColor = [UIColor colorWithHexString:bgColor_FAFAFA];
    self.lab_orderNo.textColor = [UIColor colorWithHexString:MainBlueColor];
    self.lab_carBrand.textColor = [UIColor colorWithHexString:TextColor_00];
    self.lab_carType.textColor = self.lab_carYear.textColor = self.lab_carDisplacement.textColor = self.lab_carGear.textColor = self.lab_carSeat.textColor = self.lab_carPlatNo.textColor = self.lab_carApplyTitle.textColor = self.lab_carApplyTime.textColor = [UIColor colorWithHexString:TextColor_99];
    
      XBViewBorderRadius(_btn_lookDetail, 12, 1, [UIColor colorWithHexString:MainBlueColor]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)lookDetailAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectUserCarDetail)]) {
        [_delegate selectUserCarDetail];
    }
    
    
}
@end
