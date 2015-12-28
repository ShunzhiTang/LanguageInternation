//
//  TSZInternationalLanguageController.m
//  LanguageInternation
//
//  Created by tang on 15/12/28.
//  Copyright © 2015年 shunzhitang. All rights reserved.
//

#import "TSZInternationalLanguageController.h"

static NSBundle *bundle = nil;
@implementation TSZInternationalLanguageController


+ (NSBundle *)bundle{
    return  bundle;
}

//初始化方法
+ (void)initLanguage{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [defaults valueForKey:@"userLanghuage"];
    
    if (string.length == 0) {
        
        // 获取系统当前语言版本
        
//        NSArray *language = [NSLocale preferredLanguages];
        
        NSArray *language = [defaults objectForKey:@"AppleLanguages"];
        
//        <pre class="cpp" name="code">;
        
        NSString *current = [language objectAtIndex:0];
        
        string = current;
        
        [defaults setValue:current forKey:@"userLanguage"];
        
        //保存
        [defaults synchronize];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    
    //生成bundle
    bundle = [NSBundle bundleWithPath:path];
    
}

/**
    获取当 语言方法
 */
+(void)setUserLanguage:(NSString *)language{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //第一步改变bundle的值、
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    
    
    bundle = [NSBundle bundleWithPath:path];
    
    //持久化
    [defaults setValue:language forKey:@"userLanguage"];
    
    //写入
    [defaults synchronize];
    
    
}

+  (NSString *)userLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [def valueForKey:@"userLanguage"];
    return string;
}

@end
