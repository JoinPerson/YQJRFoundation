//
//  NSDate+YQJRCategory.h
//  Pods-YQJRCategory_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import <Foundation/Foundation.h>

@interface NSDate (YQJRCategory)

+ (NSCalendar *)yqjr_sharedAutoupdatingCurrentCalendar;

@property(nonatomic, assign, readonly)NSInteger yqjr_nearestHour;
@property(nonatomic, assign, readonly)NSInteger yqjr_year;
@property(nonatomic, assign, readonly)NSInteger yqjr_month;
@property(nonatomic, assign, readonly)NSInteger yqjr_day;
@property(nonatomic, assign, readonly)NSInteger yqjr_hour;
@property(nonatomic, assign, readonly)NSInteger yqjr_minute;
@property(nonatomic, assign, readonly)NSInteger yqjr_seconds;

/// dateFormat(yyyy-MM-dd HH:mm:ss yyyyMMddHHmmss yyyy/MM/dd HH/mm/ss 等等)
- (NSString *)yqjr_stringWithDateFormat:(NSString *)dateFormat;

/// yyyy-MM-dd格式日期
- (NSString *)yqjr_stringWithDateFormatyyyy_MM_dd;

/// yyyyMMdd格式日期
- (NSString *)yqjr_stringWithDateFormatyyyyMMdd;

@end
