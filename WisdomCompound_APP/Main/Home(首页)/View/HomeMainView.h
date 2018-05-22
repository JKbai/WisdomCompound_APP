//
//  HomeMainView.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  NS_ENUM(NSInteger, HomeMoudleType) {
    
    HomeMoudleType_visitor = 0,  //预约访客
    HomeMoudleType_repairBack, //报修反馈
    HomeMoudleType_userCarApply, //用车申请
    HomeMoudleType_meetApply, //会议申请
    HomeMoudleType_wisdomFood, //智慧餐厅
    HomeMoudleType_newsInfo, //新闻资讯
    
};


@protocol HomeMainViewDelegate<NSObject>


/**
 通过代理将对应模块的点击事件传过去

 @param moudleType 模块类型
 */
- (void)selectHomeMoudleType:(HomeMoudleType)moudleType;

@end

@interface HomeMainView : UIView


/** 首页主模块类型参数 */
@property (nonatomic,assign) HomeMoudleType homeMoudleType;

@property (nonatomic,weak) id<HomeMainViewDelegate> delegate;

@end
