//
//  NSMutableDictionary+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/8/10.
//

#import "NSMutableDictionary+YQJRCategory.h"

@implementation NSMutableDictionary (YQJRCategory)

- (void)yqjr_safeSetValue:(id)value forKey:(NSString *)forKey {
    if ([forKey isKindOfClass:NSString.class]) {
        if (value != nil) {
            [self setValue:value forKey:forKey];
        }
    }
}

@end
