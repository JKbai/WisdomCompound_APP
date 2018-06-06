//
//  MineCell1.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MineCell1.h"


@interface MineCell1 ()
@property (weak, nonatomic) IBOutlet UIImageView *img_mark;

@property (weak, nonatomic) IBOutlet UILabel *lab_title;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation MineCell1

- (void)setUIWithIndexPath:(NSIndexPath *)indexPath {
    _img_mark.image = [UIImage imageNamed:[self imageArr][indexPath.row]];
    _lab_title.text = [self titleArr][indexPath.row];
    if (indexPath.row == 2) {
        _line.hidden = YES;
    }
}

- (NSArray *)imageArr {
    
    NSArray *imageArray = @[@"icon_mine_opinion", @"icon_mine_message", @"icon_mine_about"];
    
    
    return imageArray;
    
}

- (NSArray *)titleArr {
    
    NSArray *titleArray = @[@"意见反馈", @"我的消息", @"关于我们"];
    
    
    return titleArray;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
    _lab_title.textColor = [UIColor colorWithHexString:TextColor_33];
}
@end
