//
//  ViewController.m
//  LanguageInternation
//
//  Created by tang on 15/12/28.
//  Copyright © 2015年 shunzhitang. All rights reserved.
//

#import "ViewController.h"
#import "TSZInternationalLanguageController.h"

static NSString *name = @"userLanguageNotification";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *invitelLabel;

@property (weak, nonatomic) IBOutlet UIButton *btnChange;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"--------------");
    
    //注册通知，用于接收改变语言的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:name object:nil];
    
    //初始化语言
    [TSZInternationalLanguageController initLanguage];
    
    //获取bundle
    
    NSBundle *bundle = [TSZInternationalLanguageController bundle];
    
    NSString *inviteMsg = [bundle localizedStringForKey:@"Cancel" value:nil table:@"hello"];
    
    NSString *buttonInfo = [bundle localizedStringForKey:@"History" value:nil table:@"hello"];
    
    _btnChange.backgroundColor = [UIColor redColor];
    
    
    [_btnChange setTitle:buttonInfo forState:UIControlStateNormal];
    
    _invitelLabel.backgroundColor = [UIColor cyanColor];
    _invitelLabel.text = inviteMsg;
    
}


- (IBAction)clickBttonChangeLanguages:(UIButton *)sender {
    
    NSString *language = [TSZInternationalLanguageController userLanguage];
    
    if ([language isEqualToString:@"en"]) { // 判断语言进行改变
        
        [TSZInternationalLanguageController setUserLanguage:@"pt"];
        
    }else{
        [TSZInternationalLanguageController setUserLanguage:@"en"];
    }
    
    //提示刷新
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
}

/**
  通知的方法
 */
- (void)changeLanguage{
    
    [_btnChange setTitle:[[TSZInternationalLanguageController bundle]localizedStringForKey:@"History" value:nil table:@"hello" ] forState:UIControlStateNormal];
    _invitelLabel.text = [[TSZInternationalLanguageController bundle]localizedStringForKey:@"Cancel" value:nil table:@"hello"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"dianji");
}
@end
