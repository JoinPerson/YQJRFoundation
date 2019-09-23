//
//  NSString+YQJRCategory.m
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "NSString+YQJRCategory.h"
#import <CommonCrypto/CommonDigest.h>

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

+ (NSString *)yqjr_uuid {
    CFUUIDRef uuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, uuid);
    NSString *result = (__bridge_transfer NSString *)uuidString;
    CFRelease(uuid);
    return result;
}

- (NSString *)yqjr_md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,(CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
