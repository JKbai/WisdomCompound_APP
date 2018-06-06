//
//  NSString+matching.h
//  iOS-XBCategory
//
//  Created by saifing on 16/9/26.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//  正则表达式匹配手机号,邮箱,身份证号等

#import <Foundation/Foundation.h>

@interface NSString (matching)

+ (BOOL) checkMobile:(NSString *)mobileNumbel;
+ (BOOL) checkUserIdCard :(NSString *)idCard;
+ (BOOL) checkPassword:(NSString *) password;
+ (BOOL) checkURL : (NSString *) url;
+ (BOOL) checkUserName : (NSString *) userName;
+ (BOOL) checkEmail:(NSString *)email;
+ (BOOL) checkCardNo:(NSString *) cardNo;
- (BOOL)isChinese;



//删除某个特定的字符

+(NSString *) stringDeleteString:(NSString *)str;

@end
