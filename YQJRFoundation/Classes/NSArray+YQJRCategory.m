//
//  NSArray+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/3.
//

#import "NSArray+YQJRCategory.h"

@implementation NSArray (YQJRCategory)

- (NSString *)yqjr_safeStringIndex:(NSInteger)index {
    if (![self isKindOfClass:NSArray.class]) {
        return @"";
    }
    if (index < 0) {
        return @"";
    }
    if (index >= self.count) {
        return @"";
    }
    id result = [self objectAtIndex:index];
    if ([result isKindOfClass:NSNumber.class]) {
        return [NSString stringWithFormat:@"%@", result];
    }
    if ([result isKindOfClass:NSString.class]) {
        return result;
    }
    return @"";
}

@end
