//
//  NewsListCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/22.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "NewsListCell.h"


@interface NewsListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *lab_newsPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lab_newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lab_department;
@property (weak, nonatomic) IBOutlet UILabel *lab_time;

@end

@implementation NewsListCell

- (void)setUI {
    
    
    
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self setUIColor];
    
    
}


/**
 设置字体颜色
 */
- (void)setUIColor {
    
    self.lab_newsTitle.textColor = [UIColor colorWithHexString:TextViewBgColor_00];
    _lab_department.textColor = _lab_time.textColor = [UIColor colorWithHexString:TextColor_99];
    
    
    
}

@end
