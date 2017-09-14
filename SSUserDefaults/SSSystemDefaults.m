//
//  SSSystemDefaults.m
//  SSRocksdb
//
//  Created by SunSet on 2017/8/16.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "SSSystemDefaults.h"

@implementation SSSystemDefaults



#pragma mark -  SSKeyValueProtocol
// 存值
- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];
    
}


// 合并值存储
- (void)mergeObject:(NSObject *)object forKey:(NSString *)key
{
    //
}


// 取值
- (id)objectForKey:(NSString *)key
{
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return object;
}

// 移除Object
- (void)removeObjectForKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
}






@end



