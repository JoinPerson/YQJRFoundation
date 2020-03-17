//
//  YQJRAPPInformationHelper.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/3/17.
//

#import "YQJRAPPInformationHelper.h"

@implementation YQJRAPPInformationHelper

+ (NSString *)appVersion {
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

@end
