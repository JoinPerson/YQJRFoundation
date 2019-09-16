//
//  YQJRNetworkInformationHelper.m
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/16.
//

#import "YQJRNetworkInformationHelper.h"
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <SystemConfiguration/SystemConfiguration.h>

@implementation YQJRNetworkInformationHelper

#pragma mark - Public Method

+ (YQJRNetworkReachabilityStatus)networkReachabilityStatus {
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000)
    struct sockaddr_in6 address;
    bzero(&address, sizeof(address));
    address.sin6_len = sizeof(address);
    address.sin6_family = AF_INET6;
#else
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
#endif
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr *)(&address));
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityGetFlags(reachability, &flags);
    YQJRNetworkReachabilityStatus status = [self networkReachabilityStatusForFlags:flags];
    CFRelease(reachability);
    return status;
}

#pragma mark - Private Method

+ (YQJRNetworkReachabilityStatus)networkReachabilityStatusForFlags:(SCNetworkReachabilityFlags)flags {
    BOOL isReachable = ((flags & kSCNetworkReachabilityFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkReachabilityFlagsConnectionRequired) != 0);
    BOOL canConnectionAutomatically = (((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) || ((flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0));
    BOOL canConnectWithoutUserInteraction = (canConnectionAutomatically && (flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0);
    BOOL isNetworkReachable = (isReachable && (!needsConnection || canConnectWithoutUserInteraction));
    
    YQJRNetworkReachabilityStatus status = YQJRNetworkReachabilityStatusUnknown;
    if (isNetworkReachable == NO) {
        status = YQJRNetworkReachabilityStatusNotReachable;
    }
    else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
        status = YQJRNetworkReachabilityStatusReachableViaWWAN;
    }
    else {
        status = YQJRNetworkReachabilityStatusReachableViaWiFi;
    }
    
    return status;
}

@end
