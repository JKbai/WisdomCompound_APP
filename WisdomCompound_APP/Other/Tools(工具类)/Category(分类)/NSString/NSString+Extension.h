//
//  NSString+Extension.h
//  FS_HealthRoom_APP
//
//  Created by 白印潇 on 2017/11/1.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  @brief 判断字符串为 nil or @"" or null or (null) or <null>
 */
+(BOOL)isEmptyString:(NSString *)string;

/**
 *  @brief 获取去除空格后的字符串
 */
-(NSString*)trimString;

// 是否是纯数字 [0,9]
- (BOOL)isAllNumbers;

// 是否是纯英文字母 [A-Za-z]
- (BOOL)isAllLetters;

// json字符串转字典
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark - 判断是否是英文
+ (BOOL)isEnglish:(NSString *)str;

#pragma mark - 判断是否是汉子
+ (BOOL)isChinese:(NSString *)str;

#pragma mark - 判断是否是汉子和英文
+ (BOOL)isChineseAndEnglish:(NSString *)str;

/**
 *  MD5加密
 */
+ (NSString *)MD5:(NSString*)String;

/**
 登录注册等密码加密
 
 @param password 需要加密后的密码
 @return 加密后的密码
 */
+ (NSString *)MD5AESWithPassWord:(NSString *)password;


/**
 获取时间戳
 */
+ (NSString *)getTimestampByFormatter;


@end
