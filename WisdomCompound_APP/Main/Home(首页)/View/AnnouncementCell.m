//
//  AnnouncementCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "AnnouncementCell.h"

@interface AnnouncementCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab_department;
@property (weak, nonatomic) IBOutlet UILabel *lab_time;
@property (weak, nonatomic) IBOutlet UILabel *lab_content;

@end

@implementation AnnouncementCell

- (void)layoutSubviews {
    [super layoutSubviews];
    _lab_department.textColor = [UIColor colorWithHexString:MainBlueColor];
    _lab_time.textColor = [UIColor colorWithHexString:TextColor_99];
    _lab_content.textColor = [UIColor colorWithHexString:TextColor_00];
}



@end
