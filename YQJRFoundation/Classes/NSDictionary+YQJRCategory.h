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

@end
