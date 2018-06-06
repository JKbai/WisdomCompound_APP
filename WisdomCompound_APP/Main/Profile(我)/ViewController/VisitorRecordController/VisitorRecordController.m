//
//  VisitorRecordController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "VisitorRecordController.h"
#import "VisitorRecordCell.h"
#import "VisitorRecordCell.h"
@interface VisitorRecordController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *myTableView;

@property (nonatomic, strong)NSMutableArray *dataSource;
@property (nonatomic, assign)NSInteger pageNo;

@end

@implementation VisitorRecordController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
        
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"访客记录";
    
    
    self.pageNo = 1;
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self getVisitorListWith:1];
        
    }];
    self.myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self getVisitorListWith:++self.pageNo];
        
    }];
    [self.myTableView.mj_header beginRefreshing];
    

}

- (UITableView *)myTableView {
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-STATUS_NAV_HEIGHT) style:UITableViewStyleGrouped];
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
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([VisitorRecordCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([VisitorRecordCell class])];
        
   
    }
    return _myTableView;
}


- (void)getVisitorListWith:(NSInteger)pageNo {
    
    XBWeakSelf(self)
    NSDictionary *params = @{
                             @"memberId":[UserInfoManager getUserInfo].memberId,
                             @"pageNo" : @(pageNo),
                             };
    [XBNetwork POSTWithURL:k_api_visitorList parameters:params cachePolicy:0 callback:^(id responseObject, NSError *error) {
        if ([responseObject[@"code"] integerValue] == 1) {
            if (pageNo == 1) {
                [weakself.dataSource removeAllObjects];
            }
            
            if (kIsArray(responseObject[@"data"])) {
            
                for (NSDictionary *dataDic in responseObject[@"data"]) {
                    VisitorListModel *model = [VisitorListModel yy_modelWithJSON:dataDic];
                    [weakself.dataSource addObject:model];
                }
            }
        }
        [weakself.myTableView reloadData];
        [weakself.myTableView.mj_header endRefreshing];
        [weakself.myTableView.mj_footer endRefreshing];
    }];
}


#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VisitorRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VisitorRecordCell class])];
    cell.visitorListModel = self.dataSource[indexPath.section];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
