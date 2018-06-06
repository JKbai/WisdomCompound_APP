//
//  BaseDateView.h
//  FS_HealthRoom_APP
//
//  Created by 白印潇 on 2017/11/15.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseDateView : UIView
@property (nonatomic, strong) UIView *contentView;

//选择器
@property (nonatomic, strong)UIPickerView *pickerView;
//取消按钮
@property (nonatomic, strong)UIButton *cancelButton;
//确定按钮
@property (nonatomic, strong)UIButton *confirmButton;

//选择器的高度
@property (nonatomic, assign)CGFloat pickerViewHeight;

/**
 *  创建视图,初始化视图时初始数据
 */
- (void)initPickView;

/**
 *  确认按钮的点击事件
 */
- (void)clickConfirmButton;

/**
 *  pickerView的显示
 */
- (void)show;

/**
 *  移除pickerView
 */
- (void)disMiss;

@end
