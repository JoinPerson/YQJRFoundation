//
//  YQJRViewController.m
//  YQJRFoundation
//
//  Created by wangzhen on 09/16/2019.
//  Copyright (c) 2019 wangzhen. All rights reserved.
//

#import "YQJRViewController.h"
#import <YQJRFoundation/YQJRFoundation.h>

@interface YQJRViewController ()

@end

@implementation YQJRViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
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
//
//    NSLog(@"%@", [YQJRNetworkInformationHelper networkSignalType]);
    
    NSLog(@"%@", @([@"1234.9" yqjr_isPureDigital]));
    NSLog(@"%@", [@"20190923" yqjr_dateWithDateFormatStr:@"yyyyMMdd"]);
}

@end
