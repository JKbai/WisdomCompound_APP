//
//  UseCarDetailController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/26.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UseCarDetailController.h"
#import "UserCarDetailApplicantCell.h"
#import "DetailUseCarInfoCell1.h"
#import "RepoirDeailCell1.h"
@interface UseCarDetailController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *myTableView;

@end

@implementation UseCarDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用车详情";
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
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserCarDetailApplicantCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([UserCarDetailApplicantCell class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([DetailUseCarInfoCell1 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DetailUseCarInfoCell1 class])];

        
    }
    return _myTableView;
}


#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

    return 3;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.section) {
        case 0:
        {
            RepoirDeailCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirDeailCell1 class])];
            return cell;
        }
            break;
        case 1:
        {
            UserCarDetailApplicantCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserCarDetailApplicantCell class])];
            return cell;
        }
            break;
        case 2:
        {
            DetailUseCarInfoCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DetailUseCarInfoCell1 class])];
            return cell;
        }
            break;
            
        default:
            return [[UITableViewCell alloc]init];
            break;
    }

    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if (indexPath.section == 0) {
        return 40;
    }else if (indexPath.section == 1) {
        return 115;
    }else {
        return 390;
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
