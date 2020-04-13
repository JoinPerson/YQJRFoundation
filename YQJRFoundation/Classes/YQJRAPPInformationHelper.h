//
//  YQJRAPPInformationHelper.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/3/17.
//

#import <Foundation/Foundation.h>

@interface YQJRAPPInformationHelper : NSObject

/**
app版本(eg:1.0)

@return 返回结果
*/
+ (NSString *)appVersion;

/// 包标识符
+ (NSString *)bundleIdentifier;

/// APP的名称
+ (NSString *)appName;

@end
