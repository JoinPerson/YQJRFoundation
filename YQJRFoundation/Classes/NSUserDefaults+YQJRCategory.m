//
//  NSUserDefaults+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/18.
//

#import "NSUserDefaults+YQJRCategory.h"

@implementation NSUserDefaults (YQJRCategory)

+ (void)yqjr_setObject:(id)value forKey:(NSString *)defaultName {
    if (value == nil || defaultName == nil) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

+ (id)yqjr_objectForKey:(NSString *)defaultName {
    if (defaultName == nil) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)yqjr_synchronize {
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
