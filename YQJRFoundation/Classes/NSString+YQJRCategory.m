//
//  NSString+YQJRCategory.m
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "NSString+YQJRCategory.h"

@implementation NSString (YQJRCategory)

- (BOOL)yqjr_isPureDigital {
    if (self.length == 0) {
        return NO;
    } else {
        NSScanner *scan = [NSScanner scannerWithString:self];
        NSInteger val = 0;
        BOOL result = [scan scanInteger:&val] && [scan isAtEnd];
        return result;
    }
}

- (NSDate *)yqjr_dateWithDateFormatStr:(NSString *)dateFormatStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormatStr];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

- (NSDate *)yqjr_dateWithyyyy_MM_dd {
    return [self yqjr_dateWithDateFormatStr:@"yyyy-MM-dd"];
}

- (NSDate *)yqjr_dateWithyyyyMMdd {
    return [self yqjr_dateWithDateFormatStr:@"yyyyMMdd"];
}

@end
