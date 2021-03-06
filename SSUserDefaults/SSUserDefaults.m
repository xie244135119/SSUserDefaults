//
//  SSUserDefaults.m
//  SSRocksdb
//
//  Created by SunSet on 2017/8/16.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "SSUserDefaults.h"
#import "SSSystemDefaults.h"
#import "SSLevelDbDefaults.h"


@interface SSUserDefaults()
{
    NSLock *_lock;              //加锁 对写加锁
}
@end


@implementation SSUserDefaults

- (void)dealloc
{
    _lock = nil;
}


+ (SSUserDefaults *)defaultsWithType:(SSUserDefaultsType)type
{
    SSUserDefaults *defaults = nil;
    switch (type) {
        case SSUserDefaultsSystem:      //系统
            defaults = [[SSSystemDefaults alloc]init];
            break;
        case SSUserDefaultsRocksDb:     //rocksdb
//            defaults = [[SSRocksDbDefaults alloc]init];
            break;
        case SSUserDefaultsLevelDb:
        {
            static SSLevelDbDefaults *_defaults = nil;
            if (_defaults == nil) {
                _defaults = [[SSLevelDbDefaults alloc]init];
            }
            defaults = _defaults;
        }
            break;
        default:
            break;
    }
    return defaults;
}



#pragma mark - SSKeyValueProtocol
// 存值
- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    //override
}

// 合并值存储
- (void)mergeObject:(NSObject *)object forKey:(NSString *)key
{
    //override
}

// 取值
- (id)objectForKey:(NSString *)key
{
    //override
    return nil;
}

// 移除Object
- (void)removeObjectForKey:(NSString *)defaultName
{
    //override
}



@end











