//
//  NSArray+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/3.
//

#import "NSArray+YQJRCategory.h"

@implementation NSArray (YQJRCategory)

- (NSString *)yqjr_safeStringIndex:(NSInteger)index {
    id result = [self yqjr_safeObjectIndex:index];
    if ([result isKindOfClass:NSNumber.class]) {
        return [NSString stringWithFormat:@"%@", result];
    }
    if ([result isKindOfClass:NSString.class]) {
        return result;
    }
    return @"";
}

- (id)yqjr_safeObjectIndex:(NSInteger)index {
    if (index < 0 || index >= self.count) {
        return nil;
    }
    id result = [self objectAtIndex:index];
    return result;
}

@end
