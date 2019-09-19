//
//  YQJRLocationInformationHelper.h
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/19.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface YQJRLocationInformationHelper : NSObject

+ (instancetype)sharedManager;

- (CLLocation *)getLocation;

@end
