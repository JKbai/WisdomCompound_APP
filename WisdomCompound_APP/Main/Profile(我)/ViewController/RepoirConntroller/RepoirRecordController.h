//
//  RepoirRecordController.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, RepoirStatuesType) {
    RepoirStatuesType_WaitDeal = 0,//待处理
    RepoirStatuesType_Dealing,     //处理中
    RepoirStatuesType_dealed,     //已处理
};

@interface RepoirRecordController : BaseViewController

/** 处理状态 */
@property (nonatomic,assign) RepoirStatuesType repoirStatues;

@end
