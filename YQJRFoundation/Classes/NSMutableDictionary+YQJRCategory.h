//
//  NSMutableDictionary+YQJRCategory.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/8/10.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (YQJRCategory)

/// 安全保存键值对
/// @param value 要保存的值
/// @param forKey 要保存的键
- (void)yqjr_safeSetValue:(id)value forKey:(NSString *)forKey;

@end
