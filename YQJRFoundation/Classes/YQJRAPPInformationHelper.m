//
//  YQJRAPPInformationHelper.m
//  YQJRFoundation
//
//  Created by wangzhen on 2020/3/17.
//

#import "YQJRAPPInformationHelper.h"
#import "NSDictionary+YQJRCategory.h"
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/sysctl.h>

@implementation YQJRAPPInformationHelper

+ (NSString *)appVersion {
    return [[NSBundle mainBundle].infoDictionary yqjr_safeStringKeyPath:@"CFBundleShortVersionString"];
}

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle].infoDictionary yqjr_safeStringKeyPath:@"CFBundleIdentifier"];
}

+ (NSString *)appName {
    return [[NSBundle mainBundle].infoDictionary yqjr_safeStringKeyPath:@"CFBundleDisplayName"];
}

+ (BOOL)isXcodeBeingDebugged {
    // Returns true if the current process is being debugged (either
    // running under the debugger or has a debugger attached post facto).
    
    int                 junk;
    int                 mib[4];
    struct kinfo_proc   info;
    size_t              size;
    
    // Initialize the flags so that, if sysctl fails for some bizarre
    // reason, we get a predictable result.
    
    info.kp_proc.p_flag = 0;
    
    // Initialize mib, which tells sysctl the info we want, in this case
    // we're looking for information about a specific process ID.
    
    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();
    
    // Call sysctl.
    
    size = sizeof(info);
    junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
    assert(junk == 0);
    
    // We're being debugged if the P_TRACED flag is set.
    
    return ( (info.kp_proc.p_flag & P_TRACED) != 0 );
}

@end
