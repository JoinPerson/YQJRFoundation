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

/**
 获取uuid
 
 @return 返回结果
 */
+ (NSString *)yqjr_uuid;

/// 传入一个字符串返回一个对应的数字
/// @param str 传入的字符串
/// @param accurate 精确到小数点的位数
/// @param amountLength 返回对应的数字的最大长度
+ (NSString *)yqjr_returnNormalAmountWithStr:(NSString *)str
                                    accurate:(NSUInteger)accurate
                                amountLength:(NSUInteger)amountLength;

/// 过滤 Emoji 表情符号
- (NSString *)yqjr_filterEmoji;

#pragma mark - 散列函数
/**
 *  计算MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 -s "string"
 *  @endcode
 *
 *  <p>提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。<p>
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *)yqjr_md5String;

/**
 *  计算SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1
 *  @endcode
 *
 *  @return 40个字符的SHA1散列字符串
 */
- (NSString *)yqjr_sha1String;

/**
 *  计算SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256
 *  @endcode
 *
 *  @return 64个字符的SHA256散列字符串
 */
- (NSString *)yqjr_sha256String;

/**
 *  计算SHA 512散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512
 *  @endcode
 *
 *  @return 128个字符的SHA 512散列字符串
 */
- (NSString *)yqjr_sha512String;

#pragma mark - HMAC 散列函数
/**
 *  计算HMAC MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl dgst -md5 -hmac "key"
 *  @endcode
 *
 *  @return 32个字符的HMAC MD5散列字符串
 */
- (NSString *)yqjr_hmacMD5StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1 -hmac "key"
 *  @endcode
 *
 *  @return 40个字符的HMAC SHA1散列字符串
 */
- (NSString *)yqjr_hmacSHA1StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256 -hmac "key"
 *  @endcode
 *
 *  @return 64个字符的HMAC SHA256散列字符串
 */
- (NSString *)yqjr_hmacSHA256StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA512散列结果
 *
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512 -hmac "key"
 *  @endcode
 *
 *  @return 128个字符的HMAC SHA512散列字符串
 */
- (NSString *)yqjr_hmacSHA512StringWithKey:(NSString *)key;

#pragma mark - 文件散列函数

/**
 *  计算文件的MD5散列结果
 *
 *  终端测试命令：
 *  @code
 *  md5 file.dat
 *  @endcode
 *
 *  @return 32个字符的MD5散列字符串
 */
- (NSString *)yqjr_fileMD5Hash;

/**
 *  计算文件的SHA1散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha1 file.dat
 *  @endcode
 *
 *  @return 40个字符的SHA1散列字符串
 */
- (NSString *)yqjr_fileSHA1Hash;

/**
 *  计算文件的SHA256散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha256 file.dat
 *  @endcode
 *
 *  @return 64个字符的SHA256散列字符串
 */
- (NSString *)yqjr_fileSHA256Hash;

/**
 *  计算文件的SHA512散列结果
 *
 *  终端测试命令：
 *  @code
 *  openssl sha -sha512 file.dat
 *  @endcode
 *
 *  @return 128个字符的SHA512散列字符串
 */
- (NSString *)yqjr_fileSHA512Hash;

#pragma mark - NSPredicate

/// 验证手机号
/// @param phoneNum 手机号
+ (BOOL)yqjr_predicatePhoneNum:(NSString *)phoneNum;

/// 验证身份证号码
/// @param idCard 身份证号码
+ (BOOL)yqjr_predicateIdCard:(NSString *)idCard;

/// 验证银行卡
/// @param bankCard 银行卡号
+ (BOOL)yqjr_predicateBankCard:(NSString *)bankCard;

/// 验证密码规则(6到15位(由数字、字母或下划线其中两种组合))
/// @param password 密码
+ (BOOL)yqjr_predicatePassword:(NSString *)password;

/// 验证邮箱
/// @param email 邮箱号
+ (BOOL)yqjr_predicateEmail:(NSString *)email;

/// 验证中文
/// @param chinese 中文
+ (BOOL)yqjr_isChinese:(NSString *)chinese;

@end
