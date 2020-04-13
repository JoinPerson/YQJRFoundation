//
//  NSDictionary+YQJRCategory.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/2.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YQJRCategory)

/// 从字典中根据键，安全获取字符串
/// @param keyPath 键
- (NSString *)yqjr_safeStringKeyPath:(NSString *)keyPath;

/// 从字典中根据键，安全获取数组
/// @param keyPath 键
- (NSArray *)yqjr_safeArrayKeyPath:(NSString *)keyPath;

/// 安全保存键值对
/// @param value 要保存的值
/// @param forKey 要保存的键
- (void)yqjr_safeSetValue:(id)value forKey:(NSString *)forKey;

@end
