//
//  MineController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MineController.h"

#import "VisitorRecordController.h"
#import "RepoirLinePageController.h"
#import "UserCarRecordController.h"
#import "MeetRecordController.h"
#import "UserInfoController.h"
#import "FeedBackController.h"
#import "MyMessageController.h"
#import "MeetEvaluationController.h"

#import "MineHeaderView.h"
#import "MineCell1.h"
#import "MineCell2.h"
@interface MineController ()<UITableViewDelegate, UITableViewDataSource,MineHeaderViewDelegate>


@property (nonatomic, strong)UITableView *myTableView;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myTableView];
}

- (UITableView *)myTableView {
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.separatorStyle = NO;
        
        MineHeaderView *heardView = [[MineHeaderView alloc]init];
        [heardView addTarget:self action:@selector(headAction)];
        heardView.delegate = self;
        _myTableView.tableHeaderView = heardView;
        _myTableView.backgroundColor = [UIColor colorWithHexString:KBackgrourdColor];
        _myTableView.rowHeight = 50;
        if (@available(iOS 11.0, *)) {
            _myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:_myTableView];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineCell1 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MineCell1 class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineCell2 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MineCell2 class])];
    }
    return _myTableView;
}

- (void)headAction {
    UserInfoController *userInfoVC = [[UserInfoController alloc]init];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}

- (void)selectHeadViewWithTag:(NSInteger)tag {
    
    switch (tag) {
        case 11://访客记录
            {
                VisitorRecordController *visitorVC = [[VisitorRecordController alloc]init];
                [self.navigationController pushViewController:visitorVC animated:YES];
            }
            break;
        case 12://报修记录
        {
            RepoirLinePageController *repoirVC = [[RepoirLinePageController alloc]init];
            [self.navigationController pushViewController:repoirVC animated:YES];
        }
            break;
        case 13://用车记录
        {
            UserCarRecordController *userCarVC = [[UserCarRecordController alloc]init];
            [self.navigationController pushViewController:userCarVC animated:YES];
        }
            break;
        case 14://会议记录
        {
            MeetRecordController *meetVC = [[MeetRecordController alloc]init];
            [self.navigationController pushViewController:meetVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}






#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            {
                MineCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MineCell1 class])];
                [cell setUIWithIndexPath:indexPath];
                return cell;
            }
            break;
        case 1:
        {
                MineCell2 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MineCell2 class])];
             [cell setUIWithIndexPath:indexPath];
              return cell;
        }
            break;
            
        default:
            return [[UITableViewCell alloc]init];
            break;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        
        
        switch (indexPath.row) {
            case 0:
            {
                FeedBackController *feeBackVC = [[FeedBackController alloc]init];
                [self.navigationController pushViewController:feeBackVC animated:YES];
            }
                break;
            case 1:
            {
                MyMessageController *myMessageVC = [[MyMessageController alloc]init];
                [self.navigationController pushViewController:myMessageVC animated:YES];
            }
                break;
            case 2:
            {
                MeetEvaluationController *meetEvaluationVC = [[MeetEvaluationController alloc]init];
                [self.navigationController pushViewController:meetEvaluationVC animated:YES];
            }
                break;
                
            default:
                break;
        }
        
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
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithHexString:KBackgrourdColor];
    return nil;
}

@end
