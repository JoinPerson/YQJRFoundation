//
//  NSMutableArray+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/8/10.
//

#import "NSMutableArray+YQJRCategory.h"

@implementation NSMutableArray (YQJRCategory)

- (void)yqjr_safeAddObject:(id)object {
    if (object == nil) {
        return;
    }
    [self addObject:object];
}

- (void)yqjr_safeInsertObject:(id)object atIndex:(NSInteger)atIndex {
    if (object == nil) {
        return;
    }
    if (atIndex > self.count || atIndex < 0) {
        return;
    }
    [self insertObject:object atIndex:atIndex];
}

@end
