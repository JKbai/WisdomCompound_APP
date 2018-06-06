//
//  MineHeaderView.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineHeaderViewDelegate<NSObject>

- (void)selectHeadViewWithTag:(NSInteger)tag;

@end

@interface MineHeaderView : UIView

@property (nonatomic,weak) id<MineHeaderViewDelegate> delegate;

@end
