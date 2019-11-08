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

@property(nonatomic, assign)NSInteger count;

@property(nonatomic, copy)void(^action)(void);

@end

@implementation YQJRCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.count = 1;
    
    WeakObj(self)
    self.action = ^{
        StrongObj(self)
        NSLog(@"%@", @(self.count));
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.action();
}

- (void)dealloc {
    NSLog(@"%@,%s",self,__func__);
}

@end
