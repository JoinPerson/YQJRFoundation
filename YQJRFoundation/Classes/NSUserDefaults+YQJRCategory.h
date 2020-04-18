//
//  NSUserDefaults+YQJRCategory.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/18.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (YQJRCategory)

+ (void)yqjr_setObject:(id)value forKey:(NSString *)defaultName;

+ (id)yqjr_objectForKey:(NSString *)defaultName;

+ (void)yqjr_synchronize;

@end
