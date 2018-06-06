//
//  CommonControlCache.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/3.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "CommonControlCache.h"

#import "LKDBHelper.h"
@implementation CommonControlCache

static CommonControlCache *_commonControl = nil;
+ (CommonControlCache *)shareCommoncontrol{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _commonControl = [[self alloc]init];
    });
    return _commonControl;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _commonControl = [super allocWithZone:zone];
    });
    return _commonControl;
}



+ (void)updateCacheWithSuccess:(successBlock)successBlock error:(errorBlock)error {
    
    [XBNetwork POSTWithURL:k_api_commonControl parameters:nil cachePolicy:0 callback:^(id responseObject, NSError *error) {
        if ([responseObject[@"code"] intValue] == 1) {
            LKDBHelper *dbHelper = [LKDBHelper getUsingLKDBHelper];
            [dbHelper dropTableWithClass:[CommonControlModel class]];
            
            //存入数据库
            CommonControlModel *commonControlModel = [CommonControlModel yy_modelWithJSON:responseObject[@"data"]];
            [dbHelper insertToDB:commonControlModel];
             successBlock();
        }
    }];
    
    
}

//从数据空读取data数据
- (CommonControlModel *)listFromData {
    NSArray *dataArray= [CommonControlModel searchWithWhere:nil orderBy:nil offset:0 count:100];
    return  dataArray[0];
}



/*  获取报修项目列表 */
- (NSArray *)listFromDBForRepoirItem {
    CommonControlModel *model = [self listFromData];
    
    return model.repairItemVos;
}

/*  获取用车事由列表 */
- (NSArray *)listFromDBForUseCarReason {
    CommonControlModel *model = [self listFromData];
    
    return model.useCarReasonVo;
}

/*  获取访客事由列表列表 */
- (NSArray *)listFromDBForVisitreason {
    CommonControlModel *model = [self listFromData];
    
    return model.visitReasonVos;
}

/*  获取会议服务列表 */
- (NSArray *)listFromDBForMeetingservice {
    CommonControlModel *model = [self listFromData];
    
    return model.meetingServiceVos;
}


/*  获取会议事由列表 */
- (NSArray *)listFromDBForMeetingroomreason {
    CommonControlModel *model = [self listFromData];
    
    return model.meetingRoomReasonVos;
}






@end
