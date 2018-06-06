//
//  HUDHelper.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/4.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EasyShowView.h"
@interface HUDHelper : NSObject


/**
 显示转圈加载
 */
+ (void)showHud;


/**
 隐藏转圈加载
 */
+(void)hideHud;



/**
 提示吐司

 @param message 提示信息
 */
+ (void)showToastWithMessage:(NSString *)message;

@end
