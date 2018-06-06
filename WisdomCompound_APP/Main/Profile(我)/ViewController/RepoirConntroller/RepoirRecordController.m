//
//  RepoirRecordController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "RepoirRecordController.h"
#import "RepoirDetailController.h"
#import "EvaluationController.h"
#import "RepoirRecordListCell.h"
#import "RepoirRecordDealCell.h"
@interface RepoirRecordController ()<UITableViewDelegate, UITableViewDataSource,RepoirRecordListCellDelegate, RepoirRecordDealCellDelegate>
@property (nonatomic, strong)UITableView *myTableView;
@end

@implementation RepoirRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报修记录";
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
        
        if (@available(iOS 11.0, *)) {
            _myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:_myTableView];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RepoirRecordListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RepoirRecordListCell class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RepoirRecordDealCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RepoirRecordDealCell class])];
        
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
    
    switch (self.repoirStatues) {
        case RepoirStatuesType_WaitDeal://待处理
            {
                RepoirRecordListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirRecordListCell class])];
                cell.delegate = self;
                return cell;
            }
            break;
        case RepoirStatuesType_Dealing://处理中
        {
            RepoirRecordDealCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirRecordDealCell class])];
            cell.delegate = self;
            cell.isShowEvaluation = NO;
            
            return cell;
        }
            break;
        case RepoirStatuesType_dealed://已完成
        {
            RepoirRecordDealCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirRecordDealCell class])];
            cell.delegate = self;
            cell.isShowEvaluation = YES;
            return cell;
        }
            break;
        default:
            return [[UITableViewCell alloc]init];
            break;
    }
    
    

        
        
        


}



/**
 未处理的详情的点击时间
 */
- (void)selectNoDealRepoir {
    RepoirDetailController *detailVC = [[RepoirDetailController alloc]init];
    detailVC.repoirStatues = self.repoirStatues;
    [self.navigationController pushViewController:detailVC animated:YES];
}

/**
 评价
 */
- (void)selectGoEvaluation {
    EvaluationController *evaluationVC = [[EvaluationController alloc]init];
    [self.navigationController pushViewController:evaluationVC animated:YES];
}

- (void)selectSeeDetail {
    RepoirDetailController *detailVC = [[RepoirDetailController alloc]init];
    detailVC.repoirStatues = self.repoirStatues;
    [self.navigationController pushViewController:detailVC animated:YES];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.repoirStatues == RepoirStatuesType_WaitDeal) {
        return 133;
    }
    
    return 190;
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
