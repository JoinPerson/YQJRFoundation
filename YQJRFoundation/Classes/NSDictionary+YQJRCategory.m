//
//  NSDictionary+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/2.
//

#import "NSDictionary+YQJRCategory.h"

@implementation NSDictionary (YQJRCategory)

- (NSString *)yqjr_safeStringKeyPath:(NSString *)keyPath {
    if (![self isKindOfClass:NSDictionary.class]) {
        return @"";
    }
    if (![keyPath isKindOfClass:NSString.class]) {
        return @"";
    }
    id result = [self objectForKey:keyPath];
    if ([result isKindOfClass:NSNumber.class]) {
        return [NSString stringWithFormat:@"%@", result];
    }
    if ([result isKindOfClass:NSString.class]) {
        return result;
    }
    return @"";
}

- (NSArray *)yqjr_safeArrayKeyPath:(NSString *)keyPath {
    if (![self isKindOfClass:NSDictionary.class]) {
        return @[];
    }
    if (![keyPath isKindOfClass:NSString.class]) {
        return @[];
    }
    id result = [self objectForKey:keyPath];
    if ([result isKindOfClass:NSArray.class]) {
        return result;
    }
    return @[];
}

@end
