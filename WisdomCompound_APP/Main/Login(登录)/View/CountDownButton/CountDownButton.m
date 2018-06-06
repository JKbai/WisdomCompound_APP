//
//  CountDownButton.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "CountDownButton.h"
#import "UIImage+Color.h"


@implementation CountDownButton

- (void)countDownFromTime:(NSInteger)startTime unitTitle:(NSString *)unitTitle completion:(Completion)completion {
    __weak typeof(self) weakSelf = self;
    __block NSInteger remainTime = startTime;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (remainTime <= 0) { // 倒计时结束
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.enabled = YES;
                completion(weakSelf);
            });
        } else {
            NSString *timeStr = [NSString stringWithFormat:@"%ld", remainTime];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,unitTitle] forState:UIControlStateDisabled];
                [weakSelf setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#F5F5F5"]] forState:UIControlStateDisabled];
            
                weakSelf.enabled = NO;
            });
            remainTime--;
        }
    });
    dispatch_resume(timer);
}

@end
