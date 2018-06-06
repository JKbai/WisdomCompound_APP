//
//  CarApplyController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "CarApplyController.h"
#import "UseCarApplyController.h"
#import "CarListCell.h"
@interface CarApplyController ()<UITableViewDelegate, UITableViewDataSource, CarListCellDelegate>

/** tableView  */
@property (nonatomic,strong) UITableView *myTableView;

@end

@implementation CarApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用车列表";
    [self myTableView];
}



- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.backgroundColor = [UIColor clearColor];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CarListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CarListCell class])];
        [self.view addSubview:_myTableView];
    }
    return _myTableView;
}

#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CarListCell class])];
    cell.delegate = self;
    return cell;
}

- (void)selectCarWithIndexPath:(NSIndexPath *)indexPath {
    UseCarApplyController *useCarVC = [[UseCarApplyController alloc]init];
    [self.navigationController pushViewController:useCarVC animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 117;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 11;
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    
    return view;
}




@end
