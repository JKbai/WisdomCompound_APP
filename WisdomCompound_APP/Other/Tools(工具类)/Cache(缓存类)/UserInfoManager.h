//
//  UserInfoManager.h
//  fs-scheduling-iOS
//
//  Created by 白印潇 on 2017/7/12.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UseInfoModel.h"

@interface UserInfoManager : NSObject

//获取用户信息
+ (UseInfoModel *)getUserInfo;

//删除用户信息
+ (void)delUserInfo;

//设置用户信息
+ (void)setUserInfoWithInfo:(UseInfoModel *)info;

/**
 是否需要登录 NO不需要登录 YES需要登录
 
 @return 是否需要登录
 */
+ (BOOL)isLogin;


@end
