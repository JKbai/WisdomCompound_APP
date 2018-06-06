//
//  UserInfoManager.m
//  fs-scheduling-iOS
//
//  Created by 白印潇 on 2017/7/12.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import "UserInfoManager.h"

@implementation UserInfoManager

+ (UseInfoModel *)getUserInfo {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userInfoStr = [userDefaults objectForKey:@"userInfo"];
    UseInfoModel *userinfo = [UseInfoModel yy_modelWithJSON:userInfoStr];
    return userinfo;
}

+ (void)delUserInfo {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"userInfo"];
    [userDefaults synchronize];
}

+ (void)setUserInfoWithInfo:(UseInfoModel *)info {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:[info yy_modelToJSONString] forKey:@"userInfo"];
    [userDefaults synchronize];
}



+ (BOOL)isLogin {
    
    if ([UserInfoManager getUserInfo].memberId) {
        return NO;
    }else {
        return YES;
    }
    
    
}

@end
