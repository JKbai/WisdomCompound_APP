//
//  PickDateView.h
//  FS_HealthRoom_APP
//
//  Created by 白印潇 on 2017/11/15.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import "BaseDateView.h"
@class PickDateView;

@protocol  PickerDateViewDelegate<NSObject>
- (void)pickerDateView:(PickDateView *)pickerDateView selectYear:(NSInteger)year selectMonth:(NSInteger)month selectDay:(NSInteger)day;

@end

@interface PickDateView : BaseDateView



@property(nonatomic, weak)id <PickerDateViewDelegate>delegate ;

@property(nonatomic, assign)BOOL isAddYetSelect;//是否增加至今的选项
@property(nonatomic, assign)BOOL isShowDay;//是否显示日

-(void)setDefaultTSelectYear:(NSInteger)defaultSelectYear defaultSelectMonth:(NSInteger)defaultSelectMonth defaultSelectDay:(NSInteger)defaultSelectDay;

@end
