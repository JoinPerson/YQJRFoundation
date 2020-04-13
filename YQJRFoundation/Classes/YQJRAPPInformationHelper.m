//
//  YQJRAPPInformationHelper.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/3/17.
//

#import "YQJRAPPInformationHelper.h"
#import "NSDictionary+YQJRCategory.h"

@implementation YQJRAPPInformationHelper

+ (NSString *)appVersion {
    return [[NSBundle mainBundle].infoDictionary yqjr_safeStringKeyPath:@"CFBundleShortVersionString"];
}

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle].infoDictionary yqjr_safeStringKeyPath:@"CFBundleIdentifier"];
}

+ (NSString *)appName {
    return [[NSBundle mainBundle].infoDictionary yqjr_safeStringKeyPath:@"CFBundleDisplayName"];
}

@end
