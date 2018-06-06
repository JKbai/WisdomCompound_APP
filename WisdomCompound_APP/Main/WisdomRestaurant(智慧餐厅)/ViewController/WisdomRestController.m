//
//  WisdomRestController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "WisdomRestController.h"
#import "FoodCell.h"
#import "Model.h"
#import "WaterLayout.h"
@interface WisdomRestController ()<UICollectionViewDataSource, UICollectionViewDelegate, WaterLayoutDelegate>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSArray* modelArray;
@property(nonatomic, strong) WaterLayout *layout;

@end

@implementation WisdomRestController
- (NSArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [Model models];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"智慧餐厅";
    [self setUpUI];
  
}





- (void)setUpUI {
    
    WaterLayout* layout = [[WaterLayout alloc] init];
    self.layout = layout;
    layout.numberOfCol = 2;
    layout.rowPanding = 5;
    layout.colPanding = 12;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.delegate = self;
    [layout autuContentSize];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-64-44) collectionViewLayout:self.layout];
    _collectionView.backgroundColor = [UIColor colorWithHexString:bgColor_FAFAFA];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FoodCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([FoodCell class])];
    [self.view addSubview:_collectionView];
    
    [_collectionView reloadData];
    
    
}



#pragma mark UICollectionViewDataSource, UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FoodCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FoodCell class]) forIndexPath:indexPath];
    cell.model = self.modelArray[indexPath.item];
    
    return cell;
}



#pragma mark WaterLayoutDelegate
-(CGFloat)waterLayout:(WaterLayout *)waterLayout itemHeightForIndexPath:(NSIndexPath*)indexPath{
    
    Model* model = self.modelArray[indexPath.item];
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - self.layout.sectionInset.left - self.layout.sectionInset.right - (self.layout.colPanding * (self.layout.numberOfCol - 1))) / self.layout.numberOfCol;
    
    CGFloat scale = [model.w floatValue] / width;
    
    CGFloat height =  [model.h floatValue] / scale + 105;
    
    
    return height;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}



@end
