//
//  YQJRWeakTimerTool.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/7/28.
//

#import "YQJRWeakTimerTool.h"

@interface YQJRWeakTimerToolTarget : NSObject

@property(nonatomic, weak)id target;
@property(nonatomic, assign)SEL selector;
@property(nonatomic, weak)NSTimer *timer;

@end

@implementation YQJRWeakTimerToolTarget

- (void)fire:(NSTimer *)timer {
    if (self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop
    } else {
        [self.timer invalidate];
    }
}

@end

@interface YQJRWeakTimerTool ()

@end

@implementation YQJRWeakTimerTool

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                            target:(id)aTarget
                          selector:(SEL)aSelector
                          userInfo:(nullable id)userInfo
                           repeats:(BOOL)yesOrNo {
    YQJRWeakTimerToolTarget *timerTarget = [[YQJRWeakTimerToolTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:timerTarget selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    timerTarget.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timerTarget.timer forMode:NSRunLoopCommonModes];
    return timerTarget.timer;
}

@end
