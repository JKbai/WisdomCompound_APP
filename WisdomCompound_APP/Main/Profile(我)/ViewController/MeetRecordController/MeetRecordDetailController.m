//
//  MeetRecordDetailController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/27.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MeetRecordDetailController.h"
#import "RepoirDeailCell1.h"
#import "MeetRecordInfoCell.h"
#import "MeetRoomCell.h"
@interface MeetRecordDetailController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *myTableView;

@end

@implementation MeetRecordDetailController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会议详情";
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
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MeetRoomCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MeetRoomCell class])];
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MeetRecordInfoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MeetRecordInfoCell class])];
    }
    return _myTableView;
}


#define mark --- tableView的代理/数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.meetStatues == MeetStatuesType_WaitDistribution || self.meetStatues == MeetStatuesType_Refuseded) {//待分配||已拒绝
        if (indexPath.section == 0) {
            RepoirDeailCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepoirDeailCell1 class])];
            return cell;
        }else {
            MeetRecordInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MeetRecordInfoCell class])];
            return cell;
        }
    }else {//已分配和已结束
        if (indexPath.section == 0) {
            MeetRoomCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MeetRoomCell class])];
            return cell;
        }else {
            MeetRecordInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MeetRecordInfoCell class])];
            return cell;
        }
    }
}


- (UIView *)setTableHeaderViewWithMeetStatues:(MeetStatuesType)meetStatues {
    
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.backgroundColor = [UIColor colorWithHexString:@"#FFF1F1"];
   
    NSString *title = [[NSString alloc]init];
    if (meetStatues == 0) {
        title = @"   您申请的会议室正在分配中请耐心等待！";
    }else if (meetStatues == 3) {
        title = @"   会议室临时维修！";
    }
    [titleButton setTitle:title forState:UIControlStateNormal];
    titleButton.titleLabel.font = FONT(11);
     titleButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleButton setTitleColor:[UIColor colorWithHexString:@"#FF5450"] forState:UIControlStateNormal];
    titleButton.enabled = NO;
    return titleButton;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.meetStatues == MeetStatuesType_WaitDistribution || self.meetStatues == MeetStatuesType_Refuseded) {//待分配||已拒绝
        if (indexPath.section == 0) {
            return 40;
        }else {
            return 680;
        }
    }else {//已分配和已结束
        if (indexPath.section == 0) {
            return 120;
        }else {
            return 680;
        }
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (self.meetStatues == MeetStatuesType_WaitDistribution || self.meetStatues == MeetStatuesType_Refuseded) {//待分配||已拒绝
        if (section == 0) {
            return 36;
        }else {
            return 10;
        }
     }
    
    return 10;
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
  
    
    if (self.meetStatues == 0 || self.meetStatues ==3) {
        

        if (section == 0) {
             return [self setTableHeaderViewWithMeetStatues:self.meetStatues];
        }else {
            return nil;
        }
       
    }else {
        return nil;
    }
    

}
@end
