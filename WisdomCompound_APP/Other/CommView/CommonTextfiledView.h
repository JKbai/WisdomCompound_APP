//
//  CommonTextfiledView.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/21.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonTextfiledView : UIView

/** 必填标识 */
@property (nonatomic,strong) UILabel *lab_mustMark;

/** 标签  */
@property (nonatomic,strong) UILabel *lab_title;

/** 标签内容  */
@property (nonatomic,strong) UITextField *tf_content;

/** 分割线  */
@property (nonatomic,strong) UIView *line;

/** 向右的箭头  */
@property (nonatomic,strong) UIImageView *arrow;



/** 标签字  */
@property (nonatomic,copy) NSString *title;

/** 标签内容  */
@property (nonatomic,copy) NSString *subtitle;

/** 标签内容  */
@property (nonatomic,copy) NSString *content;

/** 占位文字  */
@property (nonatomic,copy) NSString *placeholder;


/** 是否显示下划线 */
@property (nonatomic,assign) BOOL isShowLine;

/** 是否显示右侧的箭头*/
@property (nonatomic,assign) BOOL isShowArrow;

/** 是否显示必填标志*/
@property (nonatomic,assign) BOOL isShowMustMark;


@end
