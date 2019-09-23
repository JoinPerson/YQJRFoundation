//
//  NSDate+YQJRCategory.m
//  Pods-YQJRCategory_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "NSDate+YQJRCategory.h"

@implementation NSDate (YQJRCategory)

+ (NSCalendar *)yqjr_sharedAutoupdatingCurrentCalendar {
    static NSCalendar *sharedAutoupdatingCurrentCalendar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAutoupdatingCurrentCalendar = [NSCalendar autoupdatingCurrentCalendar];
    });
    return sharedAutoupdatingCurrentCalendar;
}

#pragma mark - Private Method

- (NSCalendarUnit)yqjr_getCalendarUnitForNSDateYQJRCategory {
    return NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
}

#pragma mark - 拆分的日期

- (NSInteger)yqjr_nearestHour {
    NSDate *newDate = [self dateByAddingTimeInterval:60 * 30];
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:newDate];
    return components.hour;
}

- (NSInteger)yqjr_year {
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:self];
    return components.year;
}

- (NSInteger)yqjr_month {
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:self];
    return components.month;
}

- (NSInteger)yqjr_day {
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:self];
    return components.day;
}

- (NSInteger)yqjr_hour {
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:self];
    return components.hour;
}

- (NSInteger)yqjr_minute {
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:self];
    return components.minute;
}

- (NSInteger)yqjr_seconds {
    NSDateComponents *components = [[NSDate yqjr_sharedAutoupdatingCurrentCalendar] components:[self yqjr_getCalendarUnitForNSDateYQJRCategory] fromDate:self];
    return components.second;
}

#pragma mark - 日期和日期字符串互转

- (NSString *)yqjr_stringWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *strDate = [dateFormatter stringFromDate:self];
    return strDate;
}

- (NSString *)yqjr_stringWithDateFormatyyyy_MM_dd {
    return [self yqjr_stringWithDateFormat:@"yyyy-MM-dd"];
}

- (NSString *)yqjr_stringWithDateFormatyyyyMMdd {
    return [self yqjr_stringWithDateFormat:@"yyyyMMdd"];
}

@end
