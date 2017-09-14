//
//  SSRocksdbTests.m
//  SSRocksdbTests
//
//  Created by SunSet on 2017/8/16.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SSUserDefaults.h"

@interface SSRocksdbTests : XCTestCase
{
    SSUserDefaults *_sbService;            //db服务
}
@end

@implementation SSRocksdbTests

- (void)setUp {
    [super setUp];
    
    if (_sbService == nil) {
        _sbService = [SSUserDefaults defaultsWithType:SSUserDefaultsRocksDb];
    }
}

- (void)tearDown {
    
    _sbService = nil;
    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


#pragma mark - Set 方式 和 Delete 方式
// 测试1000次
- (void)testStore1
{
    NSDate *startdate = [NSDate date];
    for (NSInteger i=0; i<1000; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [_sbService setObject:value forKey:key];
    }
    
    NSDate *enddate = [NSDate date];
    NSLog(@" 执行1000次 时间:%f ",[enddate timeIntervalSinceDate:startdate]);
    
    // 删除操作
    NSDate *startdate1 = [NSDate date];
    
    for (NSInteger i=0; i<1000; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        [_sbService removeObjectForKey:key];
    }
    
    NSDate *enddate1 = [NSDate date];
    NSLog(@" 执行delete 1000次 时间:%f ",[enddate1 timeIntervalSinceDate:startdate1]);
}


// 测试1w次
- (void)testStore2
{
    NSDate *startdate = [NSDate date];
    for (NSInteger i=0; i<1000*10; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [_sbService setObject:value forKey:key];
    }
    
    NSDate *enddate = [NSDate date];
    NSLog(@" 执行1w次 时间:%f ",[enddate timeIntervalSinceDate:startdate]);
    
    
    // 删除操作
    NSDate *startdate1 = [NSDate date];
    for (NSInteger i=0; i<1000*10; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        [_sbService removeObjectForKey:key];
    }
    
    NSDate *enddate1 = [NSDate date];
    NSLog(@" 执行delete 1w次 时间:%f ",[enddate1 timeIntervalSinceDate:startdate1]);
}


// 测试10w次
- (void)testStore3
{
    NSDate *startdate = [NSDate date];
    for (NSInteger i=0; i<1000*100; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [_sbService setObject:value forKey:key];
    }
    NSDate *enddate = [NSDate date];
    NSLog(@" 执行10w次 时间:%f ",[enddate timeIntervalSinceDate:startdate]);
    
    // 删除操作
    NSDate *startdate1 = [NSDate date];
    for (NSInteger i=0; i<1000*100; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        [_sbService removeObjectForKey:key];
    }
    NSDate *enddate1 = [NSDate date];
    NSLog(@" 执行delete 10w次 时间:%f ",[enddate1 timeIntervalSinceDate:startdate1]);
}

// 测试100w次
- (void)testStore4
{
//    NSDate *startdate = [NSDate date];
//    for (NSInteger i=0; i<10000*100; i++) {
//        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
//        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
//        [_sbService setObject:value forKey:key];
//    }
//    
//    NSDate *enddate = [NSDate date];
//    NSLog(@" 执行100w次 时间:%f ",[enddate timeIntervalSinceDate:startdate]);
    
    // 删除操作
    NSDate *startdate1 = [NSDate date];
    for (NSInteger i=0; i<10000*100; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        [_sbService removeObjectForKey:key];
    }
    
    NSDate *enddate1 = [NSDate date];
    NSLog(@" 执行delete 100w次 时间:%f ",[enddate1 timeIntervalSinceDate:startdate1]);
}



#pragma mark - Put 方式
// 测试put方式
- (void)testPut
{
    // 测试
    NSDate *startdate = [NSDate date];
    for (NSInteger i=0; i<10000; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
//        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [_sbService objectForKey:key];
    }
    
    NSDate *enddate = [NSDate date];
    NSLog(@" 执行1w次 时间:%f ",[enddate timeIntervalSinceDate:startdate]);

    {
        // 测试1w次
        NSDate *startdate1 = [NSDate date];
        for (NSInteger i=0; i<10000*10; i++) {
            NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
//            NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
            [_sbService objectForKey:key];
        }
        
        NSDate *enddate1 = [NSDate date];
        NSLog(@" 执行10w次 时间:%f ",[enddate1 timeIntervalSinceDate:startdate1]);
    }

    
    {
        NSDate *startdate2 = [NSDate date];
        for (NSInteger i=0; i<10000*100; i++) {
            NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
//            NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
            [_sbService objectForKey:key];
        }
        
        NSDate *enddate2 = [NSDate date];
        NSLog(@" 执行10w次 时间:%f ",[enddate2 timeIntervalSinceDate:startdate2]);
    }
    
}


#pragma mark - 
- (void)testSystemDefaults
{
    SSUserDefaults *defaults = [SSUserDefaults defaultsWithType:SSUserDefaultsSystem];
    
    NSDate *startdate = [NSDate date];
    for (NSInteger i=0; i<1000*1; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [defaults setObject:value forKey:key];
    }
    
    NSDate *enddate = [NSDate date];
    NSLog(@" 执行1000次 时间:%f ",[enddate timeIntervalSinceDate:startdate]);
    
    NSDate *startdate1 = [NSDate date];
    for (NSInteger i=0; i<1000*10; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [defaults setObject:value forKey:key];
    }
    
    NSDate *enddate1 = [NSDate date];
    NSLog(@" 执行1w次 时间:%f ",[enddate1 timeIntervalSinceDate:startdate1]);
    
    NSDate *startdate2 = [NSDate date];
    for (NSInteger i=0; i<1000*100; i++) {
        NSString *key = [[NSString alloc]initWithFormat:@"%li",i];
        NSString *value = [[NSString alloc]initWithFormat:@"%li",random()];
        [defaults setObject:value forKey:key];
    }
    
    NSDate *enddate2 = [NSDate date];
    NSLog(@" 执行10w次 时间:%f ",[enddate2 timeIntervalSinceDate:startdate2]);
}




@end









