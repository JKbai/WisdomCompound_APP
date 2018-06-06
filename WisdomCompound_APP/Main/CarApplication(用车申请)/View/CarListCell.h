//
//  CarListCell.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/22.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CarListCellDelegate<NSObject>

- (void)selectCarWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface CarListCell : UITableViewCell

@property (nonatomic,weak) id<CarListCellDelegate> delegate;


/** <#注释#>  */
@property (nonatomic,strong) NSIndexPath *indexPath;

@end
