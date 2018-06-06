//
//  NSDate+Extension.m
//  FS_HealthRoom_APP
//
//  Created by 白印潇 on 2017/11/20.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)


//根据时间获取最近某天之内的所有时间
+ (NSDictionary *)getCurrentTimesWeekTimeWithTimeCount:(NSInteger)timCount{
   
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    //之后的天数
    theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*timCount];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM.dd"];
    //时间戳
    NSString *timestamp = [self getTheTimeTimestampWithDate:theDate];
    
    //星期
    NSDictionary *weekDic = [self getWeekDateWithInputDate:theDate];
    NSString *weekStr = [weekDic objectForKey:@"weekStr"];
    NSString *week = [weekDic objectForKey:@"week"];
    NSString *weekAs = [weekDic objectForKey:@"weekAs"];
    if (timCount == 0) {
        weekAs = @"今天";
    }
    if (timCount == 1) {
        weekAs = @"明天";
    }
    
    //日期
    NSString * currentDateStr = [dateFormatter stringFromDate:theDate];
    //返回一个字典对象
    NSDictionary *dateDic = @{
                              @"timestamp": timestamp,
                              @"weekStr" : weekStr,
                              @"week" : week,
                              @"currentDateStr" : currentDateStr,
                              @"weekAs" : weekAs,
                              };
    //    XBLog(@"时间戳:%@, 星期为:%@, 对应的日期参数:%@, 时间为:%@", timestamp, weekStr, currentDateStr);
    
    
    return dateDic;
    
}


+ (NSString *)getCurrentTimesBeforeOrLaterTimeWithTimeCount:(NSInteger)days {
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    //之后的天数
    theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*days];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    //日期
    NSString * currentDateStr = [dateFormatter stringFromDate:theDate];

    return currentDateStr;
}


//获取指定日期的时间戳  （以毫秒为单位）
+ (NSString *)getTheTimeTimestampWithDate:(NSDate *)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    //获取时间戳
    NSString *timeSp = [NSString stringWithFormat:@"%.f", (double)[date timeIntervalSince1970]*1000];
    
    return timeSp;
    
}



/**
 根据日期算星期
 
 @param inputDate 需要知道的日期
 @return 返回的星期
 */
+ (NSDictionary *)getWeekDateWithInputDate:(NSDate *)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    //获取星期str
    NSString *weekStr = [weekdays objectAtIndex:theComponents.weekday];
    
    NSString *week = @"";
    NSString *weekAs = @"";
    //针对后台参数做处理
    if ([weekStr isEqualToString:@"星期日"]) {
        week = @"7";
        weekAs = @"周日";
    }
    if ([weekStr isEqualToString:@"星期一"]) {
        week = @"1";
        weekAs = @"周一";
    }
    if ([weekStr isEqualToString:@"星期二"]) {
        week = @"2";
        weekAs = @"周二";
    }
    if ([weekStr isEqualToString:@"星期三"]) {
        week = @"3";
        weekAs = @"周三";
    }
    if ([weekStr isEqualToString:@"星期四"]) {
        week = @"4";
        weekAs = @"周四";
    }
    if ([weekStr isEqualToString:@"星期五"]) {
        week = @"5";
        weekAs = @"周五";
    }
    if ([weekStr isEqualToString:@"星期六"]) {
        week = @"6";
        weekAs = @"周六";
    }
    
    
    NSDictionary *weekDic = @{
                              @"weekStr" : weekStr,
                              @"week" : week,
                              @"weekAs" : weekAs,
                              };
    
    
    return weekDic;
}

//计算当前时间与订单生成时间的时间差，转化成分钟
+ (NSInteger)dateTimeDifferenceWithStartTime:(NSString *)startTime
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startDate =[formatter dateFromString:startTime];
    
    NSString *nowstr = [formatter stringFromDate:now];
    NSDate *nowDate = [formatter dateFromString:nowstr];
    
    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
    NSTimeInterval end = [nowDate timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    
    NSInteger minute = (NSInteger)value /60;

    return minute;
}


//获取当前的时间
+ (NSString *)currentDateString {
    return [self currentDateStringWithFormat:@"yyyy-MM-dd HH:mm"];
}

#pragma mark - 按指定格式获取当前的时间
+ (NSString *)currentDateStringWithFormat:(NSString *)formatterStr {
    // 获取系统当前时间
    NSDate *currentDate = [NSDate date];
    // 用于格式化NSDate对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置格式：yyyy-MM-dd HH:mm:ss
    formatter.dateFormat = formatterStr;
    // 将 NSDate 按 formatter格式 转成 NSString
    NSString *currentDateStr = [formatter stringFromDate:currentDate];
    // 输出currentDateStr
    return currentDateStr;
}

+ (NSString *)getPriousorLaterDateWithMonth:(int)month
{
    // 获取系统当前时间
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:currentDate options:0];
    
    // 用于格式化NSDate对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *beforeAMonthStr = [formatter stringFromDate:mDate];
    XBLog(@"一个月之前的时间-------%@", beforeAMonthStr);
    return beforeAMonthStr;
    
}


/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
- (NSDate *)getCustomDateWithHour:(NSInteger)hour {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}


+ (NSString *)getWeekDay:(NSString*)currentStr
{
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,要注意跟下面的dateString匹配，否则日起将无效
    
    NSDate*date =[dateFormat dateFromString:currentStr];
    
    NSArray*weekdays = [NSArray arrayWithObjects: [NSNull null],@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",nil];
    
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone*timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    
    NSDateComponents*theComponents = [calendar components:calendarUnit fromDate:date];
    
    return[weekdays objectAtIndex:theComponents.weekday];
    
}


@end
