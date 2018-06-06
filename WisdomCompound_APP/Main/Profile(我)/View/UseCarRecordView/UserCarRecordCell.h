//
//  UserCarRecordCell.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserCarRecordCellDelegate<NSObject>

- (void)selectUserCarDetail;

@end

@interface UserCarRecordCell : UITableViewCell


@property (nonatomic,weak) id<UserCarRecordCellDelegate> delegate;




@end
