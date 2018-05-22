//
//  CommonTextfiledView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "CommonTextfiledView.h"

@implementation CommonTextfiledView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:TextColor_ff];
        [self setUpUI];
        self.userInteractionEnabled = YES;
    }
    return self;
    
    
}


- (void)historyAction {
    
}


/**
 c
 初始化布局
 */
- (void)setUpUI {
    
    _lab_mustMark = ({
        
        UILabel *mustlable = [[UILabel alloc]init];
        mustlable.font = FONT(13);
        mustlable.text = @"*";
        mustlable.textColor = [UIColor colorWithHexString:MustMarkColor];
        [self addSubview:mustlable];
        mustlable;
        
    });
    
    
    _lab_title = ({
        
        UILabel *titlelable = [[UILabel alloc]init];
        titlelable.font = FONT(13);
        titlelable.textColor = [UIColor colorWithHexString:TextColor_66];
        [self addSubview:titlelable];
        titlelable;
        
    });
    
    
    _tf_content = ({
        
        UITextField *content = [[UITextField alloc]init];
        content.font = FONT(13);
        content.textColor = [UIColor colorWithHexString:TextColor_66];
        [self addSubview:content];
        content;
        
    });
    
    _line = ({
    
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
        [self addSubview:line];
        line;
        
    });
    
    
    _arrow = ({
       
        UIImageView *arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrowRight"]];
        [self addSubview:arrow];
        arrow;
        
    });
    
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.lab_mustMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.height.width.mas_equalTo(7);
        make.centerY.equalTo(self);
        
    }];
    
    [self.lab_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.mas_equalTo(13);
        make.left.equalTo(self.lab_mustMark).offset(12);
        make.width.mas_equalTo(54);
    }];
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14);
        make.centerY.equalTo(self.lab_title);
    }];
    
    [self.tf_content mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.lab_title.mas_right).offset(10);
        make.centerY.equalTo(self.lab_title);
        make.height.mas_equalTo(30);
        make.right.equalTo(self.arrow.mas_left).offset(-10);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.right.equalTo(self).offset(-13);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(0.5f);
    }];
}


- (void)setTitle:(NSString *)title {
    
    self.lab_title.text = title;
    
}


- (void)setPlaceholder:(NSString *)placeholder {
    self.tf_content.placeholder = placeholder;
}

- (void)setSubtitle:(NSString *)subtitle {
    self.tf_content.text = subtitle;
}

- (void)setIsShowLine:(BOOL)isShowLine {
    
    if (isShowLine) {
        self.line.hidden = NO;
    }else {
        self.line.hidden = YES;
    }
    
}


- (void)setIsShowArrow:(BOOL)isShowArrow {
    
    if (isShowArrow) {
        self.arrow.hidden = NO;
    }else {
        self.arrow.hidden = YES;
    }
    
}

- (void)setIsShowMustMark:(BOOL)isShowMustMark {
    
    if (isShowMustMark) {
        self.lab_mustMark.hidden = NO;
    }else {
        self.lab_mustMark.hidden = YES;
    }
    
}


@end
