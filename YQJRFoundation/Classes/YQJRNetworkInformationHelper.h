//
//  YQJRNetworkInformationHelper.h
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/16.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YQJRNetworkReachabilityStatus) {
    YQJRNetworkReachabilityStatusUnknown          = -1,
    YQJRNetworkReachabilityStatusNotReachable     = 0,
    YQJRNetworkReachabilityStatusReachableViaWWAN = 1,
    YQJRNetworkReachabilityStatusReachableViaWiFi = 2,
};

@interface YQJRNetworkInformationHelper : NSObject

/**
 获取网络可达性状态
 
 @return 网络可达性状态
 */
+ (YQJRNetworkReachabilityStatus)networkReachabilityStatus;

/**
 获取网络信号类型(eg:2G、3G、4G、WiFi)

 @return 返回结果
 */
+ (NSString *)networkSignalType;

/**
 是否使用代理
 
 @return 返回值
 */
+ (BOOL)isUsingProxyPort;

/**
 移动国家代码

 @return 返回结果
 */
+ (NSString *)mobileCountryCode;

/**
 移动网络代码

 @return 返回结果
 */
+ (NSString *)mobileNetworkCode;

/**
 国际移动用户识别码

 @return 返回结果
 */
+ (NSString *)getIMSI;

/**
 获取WiFi名称

 @return 返回结果
 */
+ (NSString *)getWifiName;

@end
