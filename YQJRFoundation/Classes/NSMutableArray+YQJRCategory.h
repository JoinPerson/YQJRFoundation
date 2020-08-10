//
//  NSMutableArray+YQJRCategory.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/8/10.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (YQJRCategory)

/// 安全添加对象
/// @param object 对象
- (void)yqjr_safeAddObject:(id)object;

/// 安全插入对象
/// @param object 对象
/// @param atIndex 对象插入的索引位置
- (void)yqjr_safeInsertObject:(id)object atIndex:(NSInteger)atIndex;

@end
