//
//  MeetRecordCell.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MeetRecordCellDelegate<NSObject>

- (void)selectMeetRecoordDetailWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface MeetRecordCell : UITableViewCell

@property (nonatomic,weak) id<MeetRecordCellDelegate> delegate;


/** 对应的下标  */
@property (nonatomic,strong) NSIndexPath *indexPath;

- (void)setUIWithIndexPath:(NSIndexPath *)indexPath;

@end
