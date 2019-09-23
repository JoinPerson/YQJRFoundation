//
//  NSString+YQJRCategory.h
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import <Foundation/Foundation.h>

@interface NSString (YQJRCategory)

/**
 是否是纯数字
 
 @return 返回结果
 */
- (BOOL)yqjr_isPureDigital;

/**
 根据日期字符串格式把字符串转成NSDate
 
 @param dateFormatStr 日期字符串格式
 @return 返回结果
 */
- (NSDate *)yqjr_dateWithDateFormatStr:(NSString *)dateFormatStr;

/**
 根据日期字符串yyyy-MM-dd转换成NSDate
 
 @return 返回结果
 */
- (NSDate *)yqjr_dateWithyyyy_MM_dd;

/**
 根据日期字符串yyyyMMdd转换成NSDate
 
 @return 返回结果
 */
- (NSDate *)yqjr_dateWithyyyyMMdd;

@end
