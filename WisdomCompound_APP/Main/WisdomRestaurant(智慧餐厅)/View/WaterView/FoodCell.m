//
//  FoodCell.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/30.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "FoodCell.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "Masonry.h"

@interface FoodCell ()
@property (weak, nonatomic) IBOutlet UILabel *lab_foodName;
@property (weak, nonatomic) IBOutlet UILabel *lab_foodContent;



@end

@implementation FoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.lab_foodContent layoutIfNeeded];
    _lab_foodName.textColor = [UIColor colorWithHexString:TextColor_00];
    _lab_foodContent.textColor = [UIColor colorWithHexString:TextColor_99];
    XBViewBorderRadius(_img_foodPhoto, 10, 0, [UIColor clearColor]);
}



-(void)setModel:(Model *)model{
    _model = model;
    
    [self.img_foodPhoto  sd_setImageWithURL:[NSURL URLWithString:model.img] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        model.w = [NSString stringWithFormat:@"%.2f",image.size.width];
        model.h = [NSString stringWithFormat:@"%.2f",image.size.height];
        
    }];
    
    self.lab_foodName.text = model.name;
    
    self.lab_foodContent.text = model.des;
    
  

}
@end
