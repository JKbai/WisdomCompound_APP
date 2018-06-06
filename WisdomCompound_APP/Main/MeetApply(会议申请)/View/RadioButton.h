//
//  RadioButton.h
//
//  fs-scheduling-iOS
//
//  Created by 白印潇 on 2017/7/19.
//  Copyright © 2017年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioButton : UIButton

//数组
@property (nonatomic, strong) IBOutletCollection(RadioButton) NSArray* groupButtons;

//选中的button
@property (nonatomic, readonly) RadioButton* selectedButton;

-(void) setSelected:(BOOL)selected;

//选中对应的tag值
-(void) setSelectedWithTag:(NSInteger)tag;

-(void)deselectAllButtons;

@end
