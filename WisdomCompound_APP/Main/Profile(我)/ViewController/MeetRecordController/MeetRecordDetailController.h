//
//  MeetRecordDetailController.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/27.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"


typedef NS_ENUM(NSInteger, MeetStatuesType) {
    MeetStatuesType_WaitDistribution = 0,//待分配
    MeetStatuesType_Distributioned,     //已分配
    MeetStatuesType_Finished,     //已结束
    MeetStatuesType_Refuseded,     //已拒绝
};

@interface MeetRecordDetailController : BaseViewController



/** 会议预定状态 */
@property (nonatomic,assign) MeetStatuesType meetStatues;

@end
