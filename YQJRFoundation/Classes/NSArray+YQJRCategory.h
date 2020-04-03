//
//  NSArray+YQJRCategory.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/4/3.
//

#import <Foundation/Foundation.h>

@interface NSArray (YQJRCategory)

/// 从数组中根据索引，安全获取字符串
/// @param index 索引
- (NSString *)yqjr_safeStringIndex:(NSInteger)index;

@end
