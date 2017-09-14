//
//  SSKeyValueProtocol.h
//  SSRocksdb
//
//  Created by SunSet on 2017/8/16.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SSKeyValueProtocol <NSObject>

// 存值
- (void)setObject:(NSObject *)object forKey:(NSString *)key;
// 合并值存储
- (void)mergeObject:(NSObject *)object forKey:(NSString *)key;


// 取值
- (id)objectForKey:(NSString *)key;
// 移除Object
- (void)removeObjectForKey:(NSString *)defaultName;

@end
