//
//  WaterLayout.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/30.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterLayout;

@protocol WaterLayoutDelegate <NSObject>

/**
 *  item 高度代理
 *
 *  @param waterLayout layout
 *  @param indexPath      indexPath
 *
 *  @return item高度
 */
-(CGFloat)waterLayout:(WaterLayout *)waterLayout itemHeightForIndexPath:(NSIndexPath*)indexPath;

@end

@interface WaterLayout : UICollectionViewLayout


@property (nonatomic, weak) id <WaterLayoutDelegate> delegate;

/**
 *  每行之间的间距
 */
@property (nonatomic, assign) CGFloat rowPanding;
/**
 *  每列之间的间距
 */
@property (nonatomic, assign) CGFloat colPanding;
/**
 *  列数
 */
@property (nonatomic, assign) NSInteger numberOfCol;
/**
 *  contentSize
 */
@property (nonatomic, assign) CGSize contentSize;
/**
 *  自动配置 contentSize
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;
-(void)autuContentSize;

@end
