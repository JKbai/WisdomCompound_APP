//
//  RepoirDetailController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/26.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "RepoirDetailController.h"
#import "RepoirDeailCell1.h"
#import "RepoirDeailCell2.h"
#import "RepoirDeailCell3.h"
@interface RepoirDetailController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *myTableView;

@end

@implementation RepoirDetailController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报修详情";
    [self myTableView];
}

- (UITableView *)myTableView {
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-80) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.separatorStyle = NO;
        _myTableView.backgroundColor = [UIColor colorWithHexString:KBackgrourdColor];
        
        if (@available(iOS 11.0, *)) {
            _myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:_myTableView];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RepoirDeailCell1 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RepoirDeailCell1 class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RepoirDeailCell2 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RepoirDeailCell2 class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RepoirDeailCell3 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RepoirDeailCell3 class])];
        
    }
    return _myTableView;
}


#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    if (self.repoirStatues == 0) {
        return 2;
    }else {
        return 3;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (indexPath.section == 0) {
        RepoirDeailCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirDeailCell1 class])];
        return cell;
    }else if(indexPath.section == 1){
        if (self.repoirStatues == 0) {//未处理
            RepoirDeailCell3 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirDeailCell3 class])];
            return cell;
        }else {
            RepoirDeailCell2 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirDeailCell2 class])];
            return cell;
        }
    }else {
        RepoirDeailCell3 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirDeailCell3 class])];
        return cell;
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 40;
    }else if(indexPath.section == 1){
        if (self.repoirStatues == 0) {//未处理
            return 320;
        }else if(self.repoirStatues == 1){//处理中
            return 180;
        }else{//已处理
            return 320;
        }
    }else {
        return 320;
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
