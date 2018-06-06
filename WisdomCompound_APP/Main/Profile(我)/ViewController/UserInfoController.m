//
//  UserInfoController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/24.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UserInfoController.h"
#import "UserInfoCell1.h"
#import "UserInfoCell2.h"
@interface UserInfoController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong)UITableView *myTableView;

@end

@implementation UserInfoController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号与安全";
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
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserInfoCell1 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UserInfoCell1 class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserInfoCell2 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UserInfoCell2 class])];
        
        
    }
    return _myTableView;
}


#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        UserInfoCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserInfoCell1 class])];
        
        return cell;
    }else {
        UserInfoCell2 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserInfoCell2 class])];
        [cell setUIWithIndexPath:indexPath];
        return cell;
    }
    
  
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
