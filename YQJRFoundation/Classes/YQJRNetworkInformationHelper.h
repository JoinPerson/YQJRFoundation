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

@end
