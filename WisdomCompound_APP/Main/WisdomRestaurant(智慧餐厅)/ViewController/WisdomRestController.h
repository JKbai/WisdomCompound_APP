//
//  WisdomRestController.h
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSInteger, BreakfastType) {
    BreakfastType_morning = 0,//早餐
    BreakfastType_lunch,     //午餐
    BreakfastType_dinner,     //晚餐
};
@interface WisdomRestController : BaseViewController


/** 吃餐类型 */
@property (nonatomic,assign) BreakfastType breakfastType;

@end
