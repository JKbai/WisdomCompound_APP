//
//  ZQCycleView.h
//  GuiderView
//
//  Created by 张奇 on 2017/10/13.
//  Copyright © 2017年 bocweb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZQCycleView;
@protocol ZQCycleViewDelegate <NSObject>

@optional
/** 点击图片回调 */
- (void)cycleScrollView:(ZQCycleView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@end

@interface ZQCycleView : UIView

- (instancetype)initWithframe:(CGRect)frame
                    imageUrls:(NSArray *)imageUrls
                     delegate:(id<ZQCycleViewDelegate>)delegate
                  pageControColor:(UIColor*)pageControColor;



@end
