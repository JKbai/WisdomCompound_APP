//
//  CarListCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/22.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "CarListCell.h"

@interface CarListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img_carPhoto;
//
@property (weak, nonatomic) IBOutlet UILabel *lab_carName;
@property (weak, nonatomic) IBOutlet UILabel *lab_carStatues;
@property (weak, nonatomic) IBOutlet UILabel *lab_carType;
@property (weak, nonatomic) IBOutlet UILabel *lab_carYear;
@property (weak, nonatomic) IBOutlet UILabel *lab_displacement;
@property (weak, nonatomic) IBOutlet UILabel *lab_carAutoGear;
@property (weak, nonatomic) IBOutlet UILabel *lab_carSeating;

@property (weak, nonatomic) IBOutlet UILabel *lab_carPlateNo;
@property (weak, nonatomic) IBOutlet UIButton *btn_userCar;

- (IBAction)userCarApplyAction:(UIButton *)sender;

@end

@implementation CarListCell



- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self setUIColor];
    
    XBViewBorderRadius(_lab_carStatues, 9, 1, [UIColor colorWithHexString:@"#00CE13"]);
    _lab_carStatues.textColor = [UIColor colorWithHexString:@"#00CE13"];
    XBViewBorderRadius(_btn_userCar, 11, 0, [UIColor clearColor]);
    _btn_userCar.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
    
}


/**
 设置字体颜色
 */
- (void)setUIColor {
    
    self.lab_carName.textColor = [UIColor colorWithHexString:TextViewBgColor_00];
    _lab_carType.textColor = _lab_carYear.textColor = _lab_carPlateNo.textColor = _lab_carStatues.textColor = _lab_carAutoGear.textColor = _lab_displacement.textColor = [UIColor colorWithHexString:TextColor_99];
    
    
    
}

- (IBAction)userCarApplyAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectCarWithIndexPath:)]) {
        [_delegate selectCarWithIndexPath:self.indexPath];
    }
}
@end
