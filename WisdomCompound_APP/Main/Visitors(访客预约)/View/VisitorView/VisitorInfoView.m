//
//  VisitorInfoView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "VisitorInfoView.h"


@interface VisitorInfoView ()


/** 标题数组  */
@property (nonatomic,strong) NSArray *titleArray;

/** 占位符数组  */
@property (nonatomic,strong) NSArray *placeholderArray;

@end

@implementation VisitorInfoView

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
        commonTextfield.tag = 10+i;
//        [commonTextfield.tf_content addTarget:self action:@selector(getTextFieldActionWithText:) forControlEvents:UIControlEventEditingChanged];
      
        [self addSubview:commonTextfield];
        [commonTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.mas_equalTo(52);
            make.top.mas_equalTo(52*i);
        }];
//        [self getVisitorInfoViewW:commonTextfield];
        
        if (i == self.titleArray.count-1) {
            commonTextfield.isShowLine = NO;
            commonTextfield.isShowMustMark = NO;
        }else {
            commonTextfield.isShowLine = YES;
            commonTextfield.isShowMustMark = YES;
        }
        
        if (i == 3 || i == 5) {
            if (i == 3) {
                   [commonTextfield addTarget:self action:@selector(clickCommtextFiledWithVisitorTime)];
            }else if (i == 5) {
                  [commonTextfield addTarget:self action:@selector(clickCommtextFiledWithVisitorReason)];
            }
         
            commonTextfield.isShowArrow = YES;
            commonTextfield.tf_content.userInteractionEnabled = NO;
        }else {
            commonTextfield.isShowArrow = NO;
             commonTextfield.tf_content.userInteractionEnabled = YES;
        }
        
    }
    
    
}

- (void)clickCommtextFiledWithVisitorTime {
      XBLog(@"点击了访客时间");
    
}

- (void)clickCommtextFiledWithVisitorReason {
      XBLog(@"点击了到访理由");
}


- (void)getTextFieldActionWithText:(CommonTextfiledView *)commTextField {
    
    
}

- (void)getVisitorInfoViewW:(CommonTextfiledView *)textfiledView {
  
    switch (textfiledView.tag) {
        case 10:
        {
            self.visitorType = VisitorType_name;
        }
            break;
        case 11:
        {
            self.visitorType = VisitorType_phone;
        }
            break;
        case 12:
        {
            self.visitorType = VisitorType_IdCard;
        }
            break;
        
        case 13:
        {
            self.visitorType = VisitorType_time;
        }
            break;
        case 14:
        {
            self.visitorType = VisitorType_visitorNum;
        }
            break;
        case 15:
        {
            self.visitorType = VisitorType_visitorReason;
        }
            break;
        case 16:
        {
            self.visitorType = VisitorType_carNo;
        }
            break;
            
        default:
            break;
    }
    
    
}



- (NSArray *)titleArray {
    
    if (!_titleArray) {
        _titleArray = @[
                        @"姓名",
                        @"手机号",
                        @"身份证",
                        @"到访时间",
                        @"到访人数",
                        @"到访理由",
                        @"车牌号",
                        ];
    }
    
    return _titleArray;
}


- (NSArray *)placeholderArray {
    if (!_placeholderArray) {
        _placeholderArray = @[
                              @"请输入到访客姓名",
                              @"请输入联系电话",
                              @"请输入身份证号码",
                              @"请选择到访时间",
                              @"请输入到访人数",
                              @"请选择到访理由",
                              @"请输入车牌号",
                              ];
    }
    return _placeholderArray;
}


@end
