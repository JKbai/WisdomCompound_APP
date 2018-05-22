//
//  MeetInfoView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MeetInfoView.h"

#import "CommonTextfiledView.h"


@interface MeetInfoView ()


/** 标题数组  */
@property (nonatomic,strong) NSArray *titleArray;

/** 占位符数组  */
@property (nonatomic,strong) NSArray *placeholderArray;

@end

@implementation MeetInfoView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:TextColor_ff];
        self.userInteractionEnabled = YES;
        [self setUpUI];
    }
    return self;
    
    
}


- (void)setUpUI {
    
    for (int i = 0; i < self.titleArray.count; i++) {
        CommonTextfiledView *commonTextfield = [[CommonTextfiledView alloc]init];
        commonTextfield.title = self.titleArray[i];
        commonTextfield.placeholder = self.placeholderArray[i];
        [self addSubview:commonTextfield];
        [commonTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.mas_equalTo(52);
            make.top.mas_equalTo(52*i);
        }];
        
        if (i != 1) {
            commonTextfield.isShowArrow = YES;
        }else {
            commonTextfield.isShowArrow = NO;
        }
    }
    
    UITextView *textView = [[UITextView alloc]init];
    textView.backgroundColor = [UIColor colorWithHexString:TextViewBgColor];
    textView.placeholder = @"为确保您的会议申请顺利通过，请简单描述一下会议内容";
    [self addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-12);
        make.height.mas_equalTo(100);
        make.left.equalTo(self).offset(14);
        make.right.equalTo(self).offset(-14);
    }];
    
}


- (NSArray *)titleArray {
    
    if (!_titleArray) {
        _titleArray = @[
                        @"承办单位",
                        @"参会人数",
                        @"参会单位",
                        @"开始时间",
                        @"结束时间",
                        ];
    }
    
    return _titleArray;
}


- (NSArray *)placeholderArray {
    if (!_placeholderArray) {
        _placeholderArray = @[
                              @"请选择承办单位",
                              @"请输入参会人数",
                              @"请选择参会单位",
                              @"请选择会议开始时间",
                              @"请选择会议结束时间",
                              
                              ];
    }
    return _placeholderArray;
}

@end
