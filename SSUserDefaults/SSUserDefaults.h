//
//  SSUserDefaults.h
//  SSRocksdb
//
//  Created by SunSet on 2017/8/16.
//  Copyright © 2017年 SunSet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSKeyValueProtocol.h"


typedef NS_ENUM(NSUInteger, SSUserDefaultsType) {
    SSUserDefaultsSystem,           //系统默认NSUserDefaults
    SSUserDefaultsRocksDb,          //rocksdb库
    SSUserDefaultsLevelDb,          //LevelDb库
};



@interface SSUserDefaults : NSObject<SSKeyValueProtocol>

/**
 根据类型不同 返回不同的UserDefaults

 @return UserDefaults
 */
+ (SSUserDefaults *)defaultsWithType:(SSUserDefaultsType)type;




@end
