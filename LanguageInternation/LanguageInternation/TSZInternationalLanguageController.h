//
//  TSZInternationalLanguageController.h
//  LanguageInternation
//
//  Created by tang on 15/12/28.
//  Copyright © 2015年 shunzhitang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TSZInternationalLanguageController : NSObject

/**
  获取当前的资源文件
 */

+ (NSBundle *)bundle;

/**
  初始化语言文件
 */
+ (void)initLanguage;

/**
    获取应用当前语言
 */
+ (NSString *)userLanguage;

/**
    设置当前的语言
 */

+ (void)setUserLanguage:(NSString *)language;


@end
