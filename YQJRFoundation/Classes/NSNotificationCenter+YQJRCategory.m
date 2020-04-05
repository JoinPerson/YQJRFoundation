//
//  NSNotificationCenter+YQJRCategory.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/5.
//

#import "NSNotificationCenter+YQJRCategory.h"

@implementation NSNotificationCenter (YQJRCategory)

+ (void)yqjr_addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name {
    [[self defaultCenter] addObserver:observer selector:selector name:name object:nil];
}

+ (void)yqjr_postNotificationName:(NSNotificationName)name  userInfo:(NSDictionary *)userInfo {
    [[self defaultCenter] postNotificationName:name object:nil userInfo:userInfo];
}

+ (void)yqjr_removeObserver:(id)observer {
    [[self defaultCenter] removeObserver:observer];
}

@end
