//
//  YQJRDeviceInformationHelper.h
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/20.
//

#import <Foundation/Foundation.h>

@interface YQJRDeviceInformationHelper : NSObject

/**
 是否模拟器
 
 @return 返回结果
 */
+ (BOOL)isSimuLator;

/**
 是否越狱
 
 @return 返回结果
 */
+ (BOOL)isRoot;

/**
 电池电量(结果范围[0,100])
 
 @return 返回结果
 */
+ (NSString *)batteryQuantity;

/**
 获取磁盘剩余可使用空间(单位:Bytes)
 
 @return 返回结果
 */
+ (NSString *)getFreeSize;

/**
 获取磁盘总共空间(单位:Bytes)
 
 @return 返回结果
 */
+ (NSString *)getTotalSize;

/**
 获取运行内存空间(单位:Bytes)
 
 @return 返回结果
 */
+ (NSString *)getTotalRAMSize;

/**
 获取设备的idfv标识
 
 @return 返回结果
 */
+ (NSString *)idfv;

/**
 获取设备的idfa标识
 
 @return 返回结果
 */
+ (NSString *)idfa;

/**
 获取系统版本(eg:12.4.1)
 
 @return 返回结果
 */
+ (NSString *)systemVersion;

/**
 获取设备内部名称(eg:iPhone8,2)
 
 @return 返回结果
 */
+ (NSString *)deviceInternalName;

/**
 获取设备自定义名称(eg:My iPhone)
 
 @return 返回结果
 */

/// 获取设备自定义名称(eg:My iPhone)
/// @param percentEncoding 是否百分号转义
+ (NSString *)deviceCustomNamePercentEncoding:(BOOL)percentEncoding;

@end
