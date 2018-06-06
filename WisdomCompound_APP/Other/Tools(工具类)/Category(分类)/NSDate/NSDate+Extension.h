//
//  NSDate+Extension.h
//  FS_HealthRoom_APP
//
//  Created by 白印潇 on 2017/11/20.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+ (NSString *)getTheTimeTimestampWithDate:(NSDate *)date;


/**
 根据需要计算当前天数的后几天获取时间字符串
 
 @param days 天数
 @return 时间信息
 */
+ (NSString *)getCurrentTimesBeforeOrLaterTimeWithTimeCount:(NSInteger)days;

/**
 根据需要计算当前天数的后几天获取时间信息

 @param timCount 后天数的天数
 @return 时间信息
 */
+ (NSDictionary *)getCurrentTimesWeekTimeWithTimeCount:(NSInteger)timCount;



/**
 获取某一时间和当前时间的时间差

 @param startTime 开始时间
 @return 返回的时间差
 */
+ (NSInteger)dateTimeDifferenceWithStartTime:(NSString *)startTime;



/** 获取当前的时间 */
+ (NSString *)currentDateString;

/**根据指定时间格式获取当前时间的字符串*/
+ (NSString *)currentDateStringWithFormat:(NSString *)formatterStr;


/**
 获取当前时间以月为单位的时间
 @param month 间隔的月份
 @return 返回具体的时间
 */
+ (NSString *)getPriousorLaterDateWithMonth:(int)month;



/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
- (NSDate *)getCustomDateWithHour:(NSInteger)hour ;


/**
 根据时间字符串转化为星期

 @param currentStr 传入要转化的时间字符串(yyyy-hh-dd)
 @return 返回周几
 */
+ (NSString *)getWeekDay:(NSString*)currentStr;

@end
