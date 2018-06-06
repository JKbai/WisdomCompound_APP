//
//  MineCell2.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MineCell2.h"

@interface MineCell2 ()
@property (weak, nonatomic) IBOutlet UIImageView *img_mark;
@property (weak, nonatomic) IBOutlet UILabel *lab_title;
@property (weak, nonatomic) IBOutlet UILabel *lab_subtitle;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation MineCell2

- (void)setUIWithIndexPath:(NSIndexPath *)indexPath {
    _img_mark.image = [UIImage imageNamed:[self imageArr][indexPath.row]];
    _lab_title.text = [self titleArr][indexPath.row];
    
    if (indexPath.row == 0) {
        _lab_subtitle.text = @"2.5";
    }
    if (indexPath.row == 1) {
        _lab_subtitle.text = @"V1.0.0";
    }
    
    if (indexPath.row == 2) {
        _line.hidden = YES;
        _lab_subtitle.hidden = YES;
    }
    
}

- (NSArray *)imageArr {
    
    NSArray *imageArray = @[@"icon_mine_clear", @"icon_mine_version", @"icon_mine_out"];
    
    
    return imageArray;
    
}

- (NSArray *)titleArr {
    
    NSArray *titleArray = @[@"清除缓存", @"系统版本", @"退出登录"];
    
    
    return titleArray;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
    _lab_title.textColor = [UIColor colorWithHexString:TextColor_33];
    _lab_subtitle.textColor = [UIColor colorWithHexString:TextColor_99];
}


@end
