//
//  SystemAnnouncementView.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SystemAnnouncementViewDelegate<NSObject>

- (void)selectMore;

@end

@interface SystemAnnouncementView : UIView

@property (nonatomic,weak) id<SystemAnnouncementViewDelegate> delegate;

@end
