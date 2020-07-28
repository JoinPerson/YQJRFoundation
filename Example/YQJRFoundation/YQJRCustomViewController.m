//
//  YQJRCustomViewController.m
//  YQJRFoundation_Example
//
//  Created by wangzhen on 2019/11/8.
//  Copyright © 2019 wangzhen. All rights reserved.
//

#import "YQJRCustomViewController.h"
#import <YQJRFoundation/YQJRFoundation.h>

@interface YQJRCustomViewController ()

@property(nonatomic, strong)NSTimer *timer;

@end

@implementation YQJRCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.timer = [YQJRWeakTimerTool timerWithTimeInterval:5.0f target:self selector:@selector(action:) userInfo:@{@"name":@"wangzhen"} repeats:YES];
}

- (void)action:(NSDictionary *)userInfo {
    NSLog(@"%@", userInfo);
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"%@,%s", self, __func__);
}

@end
