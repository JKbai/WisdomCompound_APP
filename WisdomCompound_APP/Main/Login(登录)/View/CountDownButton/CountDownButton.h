//
//  CountDownButton.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountDownButton;
typedef void(^Completion)(CountDownButton *countDownButton);
@interface CountDownButton : UIButton


/**
 *  @author 王梦杰, 16-06-22 14:06:00
 *
 *  开始倒计时
 *
 *  @param startTime  倒计时时间
 *  @param unitTitle  倒计时时间单位（如：s）
 *  @param completion 倒计时结束执行的Block
 */
- (void)countDownFromTime:(NSInteger)startTime unitTitle:(NSString *)unitTitle completion:(Completion)completion;


@end
