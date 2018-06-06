//
//  UserCarRecordController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UserCarRecordController.h"
#import "UseCarDetailController.h"
#import "UserCarRecordCell.h"
@interface UserCarRecordController ()<UITableViewDelegate, UITableViewDataSource, UserCarRecordCellDelegate>
@property (nonatomic, strong)UITableView *myTableView;
@end

@implementation UserCarRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用车记录";
    [self myTableView];
}

- (UITableView *)myTableView {
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.separatorStyle = NO;
        _myTableView.backgroundColor = [UIColor colorWithHexString:KBackgrourdColor];
        _myTableView.rowHeight = 50;
        if (@available(iOS 11.0, *)) {
            _myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:_myTableView];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserCarRecordCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UserCarRecordCell class])];
        
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
    UserCarRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserCarRecordCell class])];
    cell.delegate = self;
    return cell;
}




- (void)selectUserCarDetail {
    UseCarDetailController *detailVC = [[UseCarDetailController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 160;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

@end
