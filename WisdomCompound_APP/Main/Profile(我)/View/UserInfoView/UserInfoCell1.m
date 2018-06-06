//
//  UserInfoCell1.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UserInfoCell1.h"
@interface UserInfoCell1()
@property (weak, nonatomic) IBOutlet UILabel *lab_title;

@property (weak, nonatomic) IBOutlet UIImageView *img_avator;
@property (weak, nonatomic) IBOutlet UIView *line;

@end
@implementation UserInfoCell1


- (void)layoutSubviews {
    [super layoutSubviews];
    _lab_title.textColor = [UIColor colorWithHexString:TextColor_53];
    XBViewBorderRadius(_img_avator, 18, 0, [UIColor clearColor]);
    _line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
}

@end
