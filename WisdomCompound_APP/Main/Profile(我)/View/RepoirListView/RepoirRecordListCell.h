//
//  RepoirRecordListCell.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RepoirRecordListCellDelegate<NSObject>

- (void)selectNoDealRepoir;

@end

@interface RepoirRecordListCell : UITableViewCell


@property (nonatomic,weak) id<RepoirRecordListCellDelegate> delegate;


@end
