//
//  YQJRViewController.m
//  YQJRFoundation
//
//  Created by wangzhen on 09/16/2019.
//  Copyright (c) 2019 wangzhen. All rights reserved.
//

#import "YQJRViewController.h"
#import <YQJRFoundation/YQJRFoundation.h>
#import "YQJRCustomViewController.h"

@interface YQJRViewController ()

@end

@implementation YQJRViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#pragma mark - YQJRDeviceInformationHelper
    
//    NSLog(@"%@", @([YQJRDeviceInformationHelper isSimuLator]));
//    NSLog(@"%@", @([YQJRDeviceInformationHelper isRoot]));
//    NSLog(@"%@", [YQJRDeviceInformationHelper batteryQuantity]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper getFreeSize]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper getTotalSize]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper getTotalRAMSize]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper idfv]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper idfa]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper systemVersion]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper deviceInternalName]);
//    NSLog(@"%@", [YQJRDeviceInformationHelper deviceCustomName]);
    
#pragma mark - YQJRNetworkInformationHelper
    
//    NSLog(@"%@", @([YQJRNetworkInformationHelper networkReachabilityStatus]));
//    NSLog(@"%@", [YQJRNetworkInformationHelper networkSignalType]);
//    NSLog(@"%@", @([YQJRNetworkInformationHelper isUsingProxyPort]));
//    NSLog(@"%@", [YQJRNetworkInformationHelper mobileCountryCode]);
//    NSLog(@"%@", [YQJRNetworkInformationHelper mobileNetworkCode]);
//    NSLog(@"%@", [YQJRNetworkInformationHelper getIMSI]);
//    NSLog(@"%@", [YQJRNetworkInformationHelper getWifiName]);
    
#pragma mark - YQJRLocationInformationHelper
    
//    NSLog(@"%@, %@", @([[YQJRLocationInformationHelper sharedManager] getLocation].coordinate.latitude), @([[YQJRLocationInformationHelper sharedManager] getLocation].coordinate.longitude));
    
#pragma mark - YQJRFoundationCommonMacroDefinition
    
//    YQJRCustomViewController *customVC = [[YQJRCustomViewController alloc] init];
//    [self.navigationController pushViewController:customVC animated:YES];
    
#pragma mark - NSDate+YQJRCategory
    
//    NSLog(@"%@", [NSDate yqjr_sharedAutoupdatingCurrentCalendar]);
//    NSDate *currentDate = [NSDate date];
//    NSLog(@"%ld", [currentDate yqjr_nearestHour]);
//    NSLog(@"%ld", [currentDate yqjr_year]);
//    NSLog(@"%ld", [currentDate yqjr_month]);
//    NSLog(@"%ld", [currentDate yqjr_day]);
//    NSLog(@"%ld", [currentDate yqjr_hour]);
//    NSLog(@"%ld", [currentDate yqjr_minute]);
//    NSLog(@"%ld", [currentDate yqjr_seconds]);
//    NSLog(@"%@", [currentDate yqjr_stringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"]);
//    NSLog(@"%@", [currentDate yqjr_stringWithDateFormatyyyy_MM_dd]);
//    NSLog(@"%@", [currentDate yqjr_stringWithDateFormatyyyyMMdd]);
    
#pragma mark - NSString+YQJRCategory
    
//    NSLog(@"%@", @([@"146234a" yqjr_isPureDigital]));
//    NSLog(@"%@", [@"2019-11-08" yqjr_dateWithDateFormatStr:@"yyyy-MM-dd"]);
//    NSLog(@"%@", [@"2019-11-08" yqjr_dateWithyyyy_MM_dd]);
//    NSLog(@"%@", [@"20191108" yqjr_dateWithyyyyMMdd]);
//    NSLog(@"%@", [NSString yqjr_uuid]);
//    NSLog(@"%@", [@"wangzhen" yqjr_md5]);
    
#pragma mark - YQJRAPPInformationHelper
    
//    NSLog(@"%@",[YQJRAPPInformationHelper appVersion]);
//    NSLog(@"%@",[YQJRAPPInformationHelper bundleIdentifier]);
}

@end
