//
//  VisitorInfoView.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CommonTextfiledView.h"

typedef  NS_ENUM(NSInteger, VisitorType) {
    VisitorType_name = 0,  //姓名
    VisitorType_phone, //手机号
    VisitorType_IdCard,  //身份证
    VisitorType_time, //到访时间
    VisitorType_visitorNum,  //到访人数
    VisitorType_visitorReason, //到访理由
    VisitorType_carNo,  //车牌号
    
};


@interface VisitorInfoView : UIView



/** 输入框类型 */
@property (nonatomic,assign) VisitorType visitorType;

@end
