//
//  NSNotificationCenter+YQJRCategory.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/5.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (YQJRCategory)

+ (void)yqjr_addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name;

+ (void)yqjr_postNotificationName:(NSNotificationName)name  userInfo:(NSDictionary *)userInfo;

+ (void)yqjr_removeObserver:(id)observer;

@end
