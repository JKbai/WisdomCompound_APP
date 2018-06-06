//
//  RepoirRecordDealCell.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/26.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RepoirRecordDealCellDelegate<NSObject>

- (void)selectSeeDetail;

- (void)selectGoEvaluation;

@end

@interface RepoirRecordDealCell : UITableViewCell

@property (nonatomic,weak) id<RepoirRecordDealCellDelegate> delegate;

/** 是否显示评价按钮 */
@property (nonatomic,assign) BOOL isShowEvaluation;

@end
