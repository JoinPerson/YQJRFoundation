//
//  YQJRDeviceInformationHelper.m
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/20.
//

#import "YQJRDeviceInformationHelper.h"
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>

@implementation YQJRDeviceInformationHelper

+ (BOOL)isSimuLator {
    if (TARGET_OS_IPHONE == 1 && TARGET_IPHONE_SIMULATOR == 1) {
        //模拟器
        return YES;
    }else{
        //真机
        return NO;
    }
}

+ (BOOL)isRoot {
    //    "/Applications/Cydia.app" 存在 越狱
    //    "/private/var/lib/apt" 存在 越狱
    //    "Library/MobileSubstrate/MobileSubstrate.dylib" 存在 越狱
    //    "/etc/apt" 存在 越狱
    BOOL isRoot = NO;
    NSArray *array = @[@"/Applications/Cydia.app",
                       @"/private/var/lib/apt",
                       @"Library/MobileSubstrate/MobileSubstrate.dylib",
                       @"/etc/apt"];
    for (NSString *path in array) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            isRoot = YES;
            break;
        }
    }
    return isRoot;
}

+ (NSString *)batteryQuantity {
    UIDevice * device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    NSInteger batteryInt = [device batteryLevel] * 100;
    NSString *batteryStr = [NSString stringWithFormat:@"%@", @(batteryInt)];
    return batteryStr;
}

+ (NSString *)getFreeSize {
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    NSString *freeString = @"0";
    if (dictionary && error == nil) {
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        freeString = [NSString stringWithFormat:@"%@",freeFileSystemSizeInBytes];
    }
    return freeString;
}

+ (NSString *)getTotalSize{
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    NSString *totalString = @"0";
    if (dictionary && error == nil) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        totalString = [NSString stringWithFormat:@"%@",fileSystemSizeInBytes];
    }
    return totalString;
}

+ (NSString *)getTotalRAMSize {
    long long ramSize = [NSProcessInfo processInfo].physicalMemory;
    NSString *ramSizeStr = [NSString stringWithFormat:@"%@",@(ramSize)];
    return ramSizeStr;
}

+ (NSString *)idfv {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (NSString *)idfa {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

+ (NSString *)systemVersion {
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    return systemVersion;
}

+ (NSString *)deviceInternalName {
    //参考链接：https://www.theiphonewiki.com/wiki/List_of_iPhones
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

+ (NSString *)deviceCustomNamePercentEncoding:(BOOL)percentEncoding {
    NSString *name = [[UIDevice currentDevice] name];
    name = name ? : @"";
    if (percentEncoding) {
        name = [name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    return name;
}

@end
