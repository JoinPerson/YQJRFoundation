//
//  YQJRFoundationCommonMacroDefinition.h
//  Pods-YQJRFoundation_Example
//
//  Created by wangzhen on 2019/9/23.
//

#ifndef YQJRFoundationCommonMacroDefinition_h
#define YQJRFoundationCommonMacroDefinition_h

//解决循环引用的宏定义
#define WeakObj(o) __weak typeof(o) o##Weak = o;
#define StrongObj(o) __strong typeof(o) o = o##Weak;

#endif /* YQJRFoundationCommonMacroDefinition_h */
