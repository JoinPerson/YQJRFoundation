//
//  NSString+YQJRCategory.m
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "NSString+YQJRCategory.h"
#import <CommonCrypto/CommonCrypto.h>
#import "YQJRDeviceInformationHelper.h"
#import "YQJRAPPInformationHelper.h"
#import <AdSupport/AdSupport.h>

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

+ (NSString *)yqjr_returnNormalAmountWithStr:(NSString *)str
                                    accurate:(NSUInteger)accurate
                                amountLength:(NSUInteger)amountLength {
    if (str.length > 0 && str.length <= amountLength) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        double val = 0;
        BOOL result = [scan scanDouble:&val] && [scan isAtEnd];
        //是一个正常的double类型的金额
        if (result) {
            if ([str rangeOfString:@"."].location != NSNotFound) {
                //有小数点的情况下
                NSRange range = [str rangeOfString:@"."];
                if (range.location + 1 + accurate >= str.length) {
                    return str;
                } else {
                    return [str substringWithRange:NSMakeRange(0, range.location + 1 + accurate)];
                }
            } else {
                //没有小数点的情况下
                return [NSNumber numberWithDouble:val].stringValue;
            }
        } else {
            //不是一个正常的double类型的金额
            NSString *tempStr = [str substringWithRange:NSMakeRange(0, str.length - 1)];
            return [self yqjr_returnNormalAmountWithStr:tempStr accurate:accurate amountLength:amountLength];
        }
    } else if (str.length > amountLength) {
        NSString *tempStr = [str substringWithRange:NSMakeRange(0, amountLength)];
        return [self yqjr_returnNormalAmountWithStr:tempStr accurate:accurate amountLength:amountLength];
    } else {
        return nil;
    }
}

- (NSString *)yqjr_filterEmoji {
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *result = [expression stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:@""];
    return result;
}

#pragma mark - 散列函数
- (NSString *)yqjr_md5String {
    const char *str = self.UTF8String;
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)yqjr_sha1String {
    const char *str = self.UTF8String;
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)yqjr_sha256String {
    const char *str = self.UTF8String;
    unsigned char buffer[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)yqjr_sha512String {
    const char *str = self.UTF8String;
    unsigned char buffer[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - HMAC 散列函数
- (NSString *)yqjr_hmacMD5StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)yqjr_hmacSHA1StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)yqjr_hmacSHA256StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    unsigned char buffer[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA256, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)yqjr_hmacSHA512StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    unsigned char buffer[CC_SHA512_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA512, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 文件散列函数

#define FileHashDefaultChunkSizeForReadingData 4096

- (NSString *)yqjr_fileMD5Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_MD5_CTX hashCtx;
    CC_MD5_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_MD5_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)yqjr_fileSHA1Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA1_CTX hashCtx;
    CC_SHA1_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA1_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)yqjr_fileSHA256Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA256_CTX hashCtx;
    CC_SHA256_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA256_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)yqjr_fileSHA512Hash {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA512_CTX hashCtx;
    CC_SHA512_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA512_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 助手方法
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}

#pragma mark - NSPredicate

+ (BOOL)yqjr_predicatePhoneNum:(NSString *)phoneNum {
    if (![phoneNum isKindOfClass:NSString.class]) {
        return NO;
    }
    if (phoneNum.length == 0) {
        return NO;
    }
    
    NSString *phoneRegex = @"^1\\d{10}$";
    NSPredicate *phonePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    if (![phonePred evaluateWithObject:phoneNum]) {
        return NO;
    }
    return YES;
}

+ (BOOL)yqjr_predicateIdCard:(NSString *)idCard {
    if (![idCard isKindOfClass:NSString.class]) {
        return NO;
    }
    if (idCard.length == 0) {
        return NO;
    }
    
    NSInteger length = idCard.length;
    if (length != 15 && length !=18) {
        return NO;
    }

    //省份代码
    NSArray *areasArray =@[@"11", @"12", @"13", @"14", @"15", @"21", @"22", @"23", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"41", @"42", @"43", @"44", @"45", @"46", @"50", @"51", @"52", @"53", @"54", @"61", @"62", @"63", @"64", @"65", @"71", @"81", @"82", @"91"];
    
    NSString *valueStart2 = [idCard substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return NO;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year = 0;
    switch (length) {
        case 15:
            year = [idCard substringWithRange:NSMakeRange(6,2)].intValue + 1900;
            
            if (year % 4 ==0 || (year % 100 == 0 && year % 4 == 0)) {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            } else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            }
            
            numberofMatch = [regularExpression numberOfMatchesInString:idCard
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, idCard.length)];
            
            if (numberofMatch > 0) {
                return YES;
            } else {
                return NO;
            }
        case 18:
            year = [idCard substringWithRange:NSMakeRange(6,4)].intValue;
            
            if (year % 4 ==0 || (year % 100 == 0 && year % 4 ==0)) {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            } else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            }
            
            numberofMatch = [regularExpression numberOfMatchesInString:idCard
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, idCard.length)];
            
            if (numberofMatch > 0) {
                int S = ([idCard substringWithRange:NSMakeRange(0,1)].intValue +
                         [idCard substringWithRange:NSMakeRange(10,1)].intValue) *7 +
                ([idCard substringWithRange:NSMakeRange(1,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(11,1)].intValue) *9 +
                ([idCard substringWithRange:NSMakeRange(2,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(12,1)].intValue) *10 +
                ([idCard substringWithRange:NSMakeRange(3,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(13,1)].intValue) *5 +
                ([idCard substringWithRange:NSMakeRange(4,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(14,1)].intValue) *8 +
                ([idCard substringWithRange:NSMakeRange(5,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(15,1)].intValue) *4 +
                ([idCard substringWithRange:NSMakeRange(6,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(16,1)].intValue) *2 +
                [idCard substringWithRange:NSMakeRange(7,1)].intValue *1 +
                [idCard substringWithRange:NSMakeRange(8,1)].intValue *6 +
                [idCard substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S % 11;
                NSString *M = @"F";
                NSString *JYM = @"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)]; // 判断校验位
                if ([M isEqualToString:[idCard substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                } else {
                    return NO;
                }
            } else {
                return NO;
            }
        default:
            return NO;
    }
}

+ (BOOL)yqjr_predicateBankCard:(NSString *)bankCard {
    if (![bankCard isKindOfClass:NSString.class]) {
        return NO;
    }
    if (bankCard.length == 0) {
        return NO;
    }
    
    NSString *regex = @"^([0-9]{16,19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:bankCard]) {
        return NO;
    }
    return YES;
}

+ (BOOL)yqjr_predicatePassword:(NSString *)password {
    if (![password isKindOfClass:NSString.class]) {
        return NO;
    }
    if (password.length == 0) {
        return NO;
    }
    
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z_]{6,15}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:password]) {
        return NO;
    }
    return YES;
}

+ (BOOL)yqjr_predicateEmail:(NSString *)email {
    if (![email isKindOfClass:NSString.class]) {
        return NO;
    }
    if (email.length == 0) {
        return NO;
    }
    if (email.length > 30) {
        return NO;
    }
    
    NSString *regex = @"^[a-z0-9]+([._\\-] *[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:email]) {
        return NO;
    }
    return YES;
}

+ (BOOL)yqjr_isChinese:(NSString *)chinese {
    if (![chinese isKindOfClass:NSString.class]) {
        return NO;
    }
    if (chinese.length == 0) {
        return NO;
    }
    
    NSString *regex = @"[\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:chinese]) {
        return YES;
    }
    return NO;
}

@end
