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
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>

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

+ (NSString *)networkSignalType {
    NSString *networkSignalTypeStr = @"";
    YQJRNetworkReachabilityStatus status = [self networkReachabilityStatus];
    if (status == YQJRNetworkReachabilityStatusReachableViaWiFi) {
        networkSignalTypeStr = @"WiFi";
    } else if (status == YQJRNetworkReachabilityStatusReachableViaWWAN) {
        NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                                   CTRadioAccessTechnologyGPRS,
                                   CTRadioAccessTechnologyCDMA1x];
        NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,
                                   CTRadioAccessTechnologyWCDMA,
                                   CTRadioAccessTechnologyHSUPA,
                                   CTRadioAccessTechnologyCDMAEVDORev0,
                                   CTRadioAccessTechnologyCDMAEVDORevA,
                                   CTRadioAccessTechnologyCDMAEVDORevB,
                                   CTRadioAccessTechnologyeHRPD];
        NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
        CTTelephonyNetworkInfo *teleInfo= [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
        if ([typeStrings2G containsObject:accessString]) {
            networkSignalTypeStr = @"2G";
        } else if ([typeStrings3G containsObject:accessString]) {
            networkSignalTypeStr = @"3G";
        } else if ([typeStrings4G containsObject:accessString]) {
            networkSignalTypeStr = @"4G";
        }
    }
    return networkSignalTypeStr;
}

+ (BOOL)isUsingProxyPort {
    CFDictionaryRef dicRef = CFNetworkCopySystemProxySettings();
    const CFStringRef proxyCFstr = CFDictionaryGetValue(dicRef, (const void *)kCFNetworkProxiesHTTPProxy);
    NSString *proxy = (__bridge NSString *)proxyCFstr;
    return proxy.length > 0;
}

+ (NSString *)mobileCountryCode {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mcc = [carrier mobileCountryCode];
    return mcc != nil ? mcc : @"";
}

+ (NSString *)mobileNetworkCode {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mnc = [carrier mobileNetworkCode];
    return mnc != nil ? mnc : @"";
}

+ (NSString *)getIMSI {
    NSString *imsi = [NSString stringWithFormat:@"%@%@", [self mobileCountryCode], [self mobileNetworkCode]];
    return imsi;
}

+ (NSString *)getWifiName {
    NSString *wifiName = @"";
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return @"";
    }
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(wifiInterfaces);
    return wifiName;
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
