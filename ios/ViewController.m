//
//  ViewController.m
//  ios
//
//  Created by SunSet on 2017/8/14.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "ViewController.h"
#import "SSUserDefaults.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 测试
// 测试
- (void)test
{
    SSUserDefaults *service = [SSUserDefaults defaultsWithType:SSUserDefaultsLevelDb];
    
    NSString *key = @"maifoudomai";
    NSDictionary *value = @{@"key":@"下水电费", @"value":@"啊打水电费"};
    
    NSString *key2 = @"amdloginsuccess";
    NSString *value2 = @"asdfas";
    
    NSString *key3 = @"firstlogin";
    NSString *value3 = @"我们阿萨帝发生地方";
    
    
    [service setObject:value forKey:key];
    [service setObject:value2 forKey:key2];
    [service mergeObject:value3 forKey:key3];

    NSLog(@" 取值 :%@ ",[service objectForKey:key]);
    [service removeObjectForKey:key];
    NSLog(@" 删除之后%@ ",[service objectForKey:key]);
}


// 测试用例 1w次存储
- (void)testUIkit
{
    SSUserDefaults *service = [SSUserDefaults defaultsWithType:SSUserDefaultsRocksDb];
    
    NSString *key = @"maifoudomai";
    NSDictionary *value = @{@"key":@"下水电费", @"value":@"啊打水电费"};
    
    NSString *key2 = @"amdloginsuccess";
    NSString *value2 = @"asdfas";
    
    NSString *key3 = @"firstlogin";
    NSString *value3 = @"我们阿萨帝发生地方";
    
    
    [service setObject:value forKey:key];
    [service setObject:value2 forKey:key2];
    [service mergeObject:value3 forKey:key3];
    
    NSLog(@" 取值 :%@ ",[service objectForKey:key]);
    [service removeObjectForKey:key];
    NSLog(@" 删除之后%@ ",[service objectForKey:key]);
}




@end





