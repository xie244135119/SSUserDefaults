//
//  SSLevelDbDefaults.m
//  SSUserDefaults
//
//  Created by SunSet on 2017/9/14.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import "SSLevelDbDefaults.h"
//#import "LevelDB.h"
#import <Objective-LevelDB/LevelDB.h>

@interface SSLevelDbDefaults()
{
    LevelDB *_levelDb;              //
}
@end

@implementation SSLevelDbDefaults



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
    LevelDBOptions options = [LevelDB makeOptions];
    options.createIfMissing = YES;
    
    LevelDB *db = [LevelDB databaseInLibraryWithName:@"SSLevelDb" andOptions:options];
    
    // 创建db
//    LevelDB *db = [LevelDB databaseAtPath:[self _rocksDbPath] andDBOptions:^(RocksDBOptions * _Nonnull options) {
//        options.createIfMissing = YES;
//        // 写入所有日志 10M大小
//        options.maxLogFileSize = 10*1024*1024;
//    }];
//    NSLog(@" Rocksdb 存储位置:%@ ",[self _rocksDbPath]);
    _levelDb = db;
    
    // 设置默认配置项
//    [db setDefaultReadOptions:^(RocksDBReadOptions * _Nonnull readOptions) {
//        // 不放在缓存中
//        //        readOptions.fillCache = NO;
//        // 验证 数据
//        readOptions.verifyChecksums = YES;
//    } writeOptions:^(RocksDBWriteOptions * _Nonnull writeOptions) {
//        // 异步写入
//        writeOptions.syncWrites = NO;
//        // 不首先写入日志
//        writeOptions.disableWriteAheadLog = YES;
//        // 写入不存在的列的时候 不能忽略
//        writeOptions.ignoreMissingColumnFamilies = NO;
//    }];
}



#pragma mark - SSKeyValueProtocol

// 设置值
- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    [_levelDb setObject:object forKey:key];
}


// 取值
- (id)objectForKey:(NSString *)key
{
    NSData *keydata = [key dataUsingEncoding:4];
    id resault = [_levelDb objectForKey:keydata];
    return resault;
}


// 移除Object
- (void)removeObjectForKey:(NSString *)defaultName
{
    //
    [_levelDb removeObjectForKey:defaultName];
}

// 合并取值
- (void)mergeObject:(NSObject *)object forKey:(NSString *)key
{
    
}



#pragma mark -

// rocksdb 数据库存储地址
- (NSString *)_rocksDbPath
{
    NSString *path = [@"Library/Caches" stringByAppendingFormat:@"/SSLevelDb"];
    NSString *filepath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    BOOL isexist = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:filepath isDirectory:&isexist];
    if (!isexist) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filepath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return filepath;
}




@end







