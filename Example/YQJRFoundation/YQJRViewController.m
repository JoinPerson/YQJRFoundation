//
//  YQJRViewController.m
//  YQJRFoundation
//
//  Created by wangzhen on 09/16/2019.
//  Copyright (c) 2019 wangzhen. All rights reserved.
//

#import "YQJRViewController.h"
#import <YQJRFoundation/YQJRNetworkInformationHelper.h>

@interface YQJRViewController ()

@end

@implementation YQJRViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    YQJRNetworkReachabilityStatus status = [YQJRNetworkInformationHelper networkReachabilityStatus];
//    NSLog(@"%@",@(status));
    
    NSLog(@"%@", @([YQJRNetworkInformationHelper isUsingProxyPort]));
}

@end
