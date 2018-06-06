//
//  CommonControlCache.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/3.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonControlModel.h"
typedef void (^successBlock)(void);
typedef void (^errorBlock)(NSString *err);
@interface CommonControlCache : NSObject


+ (CommonControlCache *)shareCommoncontrol;


/**
 更新公用配置接口

 @param successBlock 成功回调
 @param error 失败回调
 */
+ (void)updateCacheWithSuccess:(successBlock)successBlock error:(errorBlock)error;

/*  获取报修项目列表 */
- (NSArray *)listFromDBForRepoirItem;

/*  获取用车事由列表 */
- (NSArray *)listFromDBForUseCarReason;

/*  获取访客事由列表列表 */
- (NSArray *)listFromDBForVisitreason;

/*  获取会议服务列表 */
- (NSArray *)listFromDBForMeetingservice;


/*  获取会议事由列表 */
- (NSArray *)listFromDBForMeetingroomreason;



@end
