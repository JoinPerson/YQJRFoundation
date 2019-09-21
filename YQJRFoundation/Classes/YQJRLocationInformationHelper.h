//
//  YQJRLocationInformationHelper.h
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/19.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface YQJRLocationInformationHelper : NSObject

/**
 单例获取对象
 
 @return 返回结果
 */
+ (instancetype)sharedManager;

/**
 获取定位位置
 
 @return 返回结果
 */
- (CLLocation *)getLocation;

@end
