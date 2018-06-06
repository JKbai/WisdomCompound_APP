//
//  MeetRecordCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MeetRecordCell.h"

@interface MeetRecordCell ()

@property (weak, nonatomic) IBOutlet UIView *bg_meetDetailBg;

@property (weak, nonatomic) IBOutlet UILabel *lab_meetNo;
@property (weak, nonatomic) IBOutlet UILabel *lab_orderStatues;

@property (weak, nonatomic) IBOutlet UIImageView *img_meetPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lab_meetRoomName;
@property (weak, nonatomic) IBOutlet UILabel *lab_roomNo;
@property (weak, nonatomic) IBOutlet UILabel *lab_roomNum;
@property (weak, nonatomic) IBOutlet UIView *view_serviseBg;

@property (weak, nonatomic) IBOutlet UILabel *lab_applyTimeTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_applyTime;
@property (weak, nonatomic) IBOutlet UIButton *btn_lookDetail;
- (IBAction)LookDetailAction:(UIButton *)sender;

@end

@implementation MeetRecordCell


- (void)setUIWithIndexPath:(NSIndexPath *)indexPath {
    self.indexPath = indexPath;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _lab_meetNo.textColor = [UIColor colorWithHexString:MainBlueColor];
    _bg_meetDetailBg.backgroundColor = [UIColor colorWithHexString:bgColor_FAFAFA];
    self.lab_meetRoomName.textColor = [UIColor colorWithHexString:TextColor_00];
    self.lab_roomNo.textColor = self.lab_roomNum.textColor = self.lab_applyTime.textColor = self.lab_applyTimeTitle.textColor = [UIColor colorWithHexString:TextColor_99];
      XBViewBorderRadius(_btn_lookDetail, 12, 1, [UIColor colorWithHexString:MainBlueColor]);
    
}


- (IBAction)LookDetailAction:(UIButton *)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectMeetRecoordDetailWithIndexPath:)]) {
        [_delegate selectMeetRecoordDetailWithIndexPath:self.indexPath];
    }
    
    
}
@end
