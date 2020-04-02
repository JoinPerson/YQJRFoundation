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
        return nil;
    }
    if (![keyPath isKindOfClass:NSString.class]) {
        return nil;
    }
    id result = [self objectForKey:keyPath];
    if (![result isKindOfClass:NSString.class]) {
        return nil;
    }
    return result;
}

@end
