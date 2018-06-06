//
//  FoodCell.h
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/30.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface FoodCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_foodPhoto;

@property (nonatomic, strong) Model* model;

@end
