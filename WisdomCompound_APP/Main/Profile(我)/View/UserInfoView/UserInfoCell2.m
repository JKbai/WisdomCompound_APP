//
//  UserInfoCell2.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UserInfoCell2.h"

@interface UserInfoCell2 ()

@property (weak, nonatomic) IBOutlet UILabel *lab_title;
@property (weak, nonatomic) IBOutlet UILabel *lab_content;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation UserInfoCell2


- (void)setUIWithIndexPath:(NSIndexPath *)indexPath {
    NSArray *titleArray = @[@"昵称", @"姓名", @"部门", @"手机号"];
    NSArray *content = @[@"你猜猜", @"何海洋", @"吃屎部", @"18710835042"];
    
    _lab_title.text = titleArray[indexPath.row - 1];
    _lab_content.text = content[indexPath.row - 1];
    
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _lab_title.textColor = [UIColor colorWithHexString:TextColor_53];
    _lab_content.textColor = [UIColor colorWithHexString:TextColor_99];
    _line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
}

@end
