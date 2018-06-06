//
//  HUDHelper.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/4.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "HUDHelper.h"

@implementation HUDHelper


+ (void)showHud {
    
    [EasyLodingView showLodingText:@"加载中..." config:^EasyLodingConfig *{
        
        int type = LodingShowTypeTurnAround;
        return [EasyLodingConfig shared].setLodingType(type).setSuperReceiveEvent(NO);;
    }];
    
}


+(void)hideHud {
    [EasyLodingView hidenLoding];
}


+ (void)showToastWithMessage:(NSString *)message {
    [EasyTextView showText:message config:^EasyTextConfig *{
        //（这三种方法都是一样的，根据使用习惯选择一种就行。|| 不传的参数就会使用EasyTextGlobalConfig全局配置的属性）
        //方法一
        //return [EasyTextConfig configWithSuperView:self.view superReceiveEvent:ShowTextEventUndefine animationType:TextAnimationTypeNone textStatusType:TextStatusTypeBottom];
        //方法二
        //return [EasyTextConfig shared].setBgColor([UIColor lightGrayColor]).setShadowColor([UIColor clearColor]).setStatusType(TextStatusTypeBottom);
        //方法三
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor blackColor] ;
        config.titleColor = [UIColor whiteColor];
        config.titleFont = [UIFont systemFontOfSize:12];
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeBottom ;
        return config ;
    }];
}


@end
