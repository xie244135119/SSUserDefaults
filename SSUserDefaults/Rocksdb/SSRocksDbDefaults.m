//
//  SSRocksDbDefaults.m
//  SSRocksdb
//
//  Created by SunSet on 2017/8/16.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "SSRocksDbDefaults.h"
#import <ObjectiveRocks.h>

@interface SSRocksDbDefaults()<SSKeyValueProtocol>
{
    RocksDB *_rocksDb;          //
}
@end

@implementation SSRocksDbDefaults

- (void)dealloc
{
    _rocksDb = nil;
}


- (instancetype)init
{
    if (self = [super init]) {
        // 打开数据库
        [self openDb];
    }
    return self;
}




- (void)openDb
{
    // 创建db
    RocksDB *db = [RocksDB databaseAtPath:[self _rocksDbPath] andDBOptions:^(RocksDBOptions * _Nonnull options) {
        options.createIfMissing = YES;
        // 写入所有日志 10M大小
        options.maxLogFileSize = 10*1024*1024;
    }];
    NSLog(@" Rocksdb 存储位置:%@ ",[self _rocksDbPath]);
    _rocksDb = db;
    
    // 设置默认配置项
    [db setDefaultReadOptions:^(RocksDBReadOptions * _Nonnull readOptions) {
        // 不放在缓存中
        //        readOptions.fillCache = NO;
        // 验证 数据
        readOptions.verifyChecksums = YES;
    } writeOptions:^(RocksDBWriteOptions * _Nonnull writeOptions) {
        // 异步写入
        writeOptions.syncWrites = NO;
        // 不首先写入日志
        writeOptions.disableWriteAheadLog = YES;
        // 写入不存在的列的时候 不能忽略
        writeOptions.ignoreMissingColumnFamilies = NO;
    }];
}



#pragma mark - SSKeyValueProtocol

// 设置值
- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    NSData *keydata = [key dataUsingEncoding:4];
    NSData *valuedata = [NSKeyedArchiver archivedDataWithRootObject:object];
    [_rocksDb setData:valuedata forKey:keydata error:nil];
    [NSNumber numberWithBool:1];
}


// 取值
- (id)objectForKey:(NSString *)key
{
    NSData *keydata = [key dataUsingEncoding:4];
    NSError *error = nil;
    NSData *data = [_rocksDb dataForKey:keydata error:&error];
    if (data != NULL) {
        id resault = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return resault;
    }
    return nil;
}


// 移除Object
- (void)removeObjectForKey:(NSString *)defaultName
{
    //
    NSData *keydata = [defaultName dataUsingEncoding:4];
    NSError *error = nil;;
    [_rocksDb deleteDataForKey:keydata error:&error];
    //    NSLog(@" 删除结果:%i ",resault);
}

// 合并取值
- (void)mergeObject:(NSObject *)object forKey:(NSString *)key
{
    
}



#pragma mark -

// rocksdb 数据库存储地址
- (NSString *)_rocksDbPath
{
    NSString *path = [@"Library/Caches" stringByAppendingFormat:@"/SSRocksdb"];
    NSString *filepath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    BOOL isexist = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:filepath isDirectory:&isexist];
    if (!isexist) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filepath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return filepath;
}




@end













