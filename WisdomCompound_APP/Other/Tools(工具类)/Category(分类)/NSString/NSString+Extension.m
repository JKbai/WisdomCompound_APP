//
//  NSString+Extension.m
//  FS_HealthRoom_APP
//
//  Created by 白印潇 on 2017/11/1.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>
#import "AESCipher.h"
@implementation NSString (Extension)

+ (BOOL)isEmptyString:(NSString *)string
{
    if ([string isKindOfClass:[NSString class]] == NO) {
        return YES;
    }
    if (string.length == 0) {
        return YES;
    }
    NSString* trimString = string.trimString;
    if (trimString.length == 0) {
        return YES;
    }
    NSString* lowercaseString = trimString.lowercaseString;
    if ([lowercaseString isEqualToString:@"(null)"] || [lowercaseString isEqualToString:@"null"] || [lowercaseString isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

- (NSString *)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isAllNumbers
{
    NSCharacterSet *set = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *set2 = [NSCharacterSet characterSetWithCharactersInString:self];
    return [set isSupersetOfSet:set2];
}

- (BOOL)isAllLetters
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
    NSCharacterSet *inverted = [set invertedSet];
    NSRange range = [self rangeOfCharacterFromSet:inverted];
    return range.location == NSNotFound;
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

#pragma mark - 判断是否是英文
+ (BOOL)isEnglish:(NSString *)str
{
    NSString *match = @"(^[a-zA-Z]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:str];
}

#pragma mark - 判断是否是汉子
+ (BOOL)isChinese:(NSString *)str
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:str];
}

#pragma mark - 判断是否是汉子和英文
+ (BOOL)isChineseAndEnglish:(NSString *)str
{
    NSString *match = @"(^[\u4E00-\u9FA5A-Za-z]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:str];
}

#pragma mark-- MD5加密
+ (NSString *)MD5:(NSString*)String {
    
    const char* str = [String UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}

+ (NSString *)MD5AESWithPassWord:(NSString *)password {
    
    
    NSString *md5Str = [NSString MD5:password];
    NSString *sv = @"Ix4c$S732nqix*cH";
    NSString *resultStr = [NSString stringWithFormat:@"%@%@", md5Str, sv];
    NSString *md52 = [NSString MD5:resultStr];

    NSRange range = NSMakeRange(8,16);
    NSString *prefix = [md52 substringWithRange:range];

    //AES加密
    NSString *key = @"16BytesLengthKey";
    NSString *cipherText = aesEncryptString(prefix, key);
    //    XBLog(@"prefix-----%@", prefix);
    //    XBLog(@"第二次MD5加密：-----%@", md5Str);
    //    XBLog(@"第一次MD5-------%@", md52);
    //    XBLog(@"%@", resultStr);
    //    XBLog(@"AES加密后-----%@", cipherText);
    //    NSString *decryptedText = aesDecryptString(cipherText, key);
    //    XBLog(@"AES解密后-----%@", decryptedText);
    return cipherText;
}

/**
 获取时间戳
 */
+ (NSString *)getTimestampByFormatter {
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyyMMddHHmmss"];
//    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
//    NSString *timeStr = [formatter stringFromDate:[NSDate date]];
//    return timeStr;
    
    NSTimeInterval intrval =[[NSDate date] timeIntervalSince1970];
    NSString *timeSp = [NSString stringWithFormat:@"%.0f", intrval*1000];
    return timeSp;
}

@end
