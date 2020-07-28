//
//  YQJRWeakTimerTool.h
//  YQJRFoundation
//
//  Created by wangzhen on 2020/7/28.
//

#import <Foundation/Foundation.h>

@interface YQJRWeakTimerTool : NSObject

/// 返回一个 NSTimer 对象(注意:最好是在主线程中调用)
/// @param ti 间隔时间
/// @param aTarget 目标
/// @param aSelector 方法
/// @param userInfo 参数
/// @param yesOrNo 是否循环
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                            target:(id)aTarget
                          selector:(SEL)aSelector
                          userInfo:(id)userInfo
                           repeats:(BOOL)yesOrNo;

@end
