//
//  HomeMainController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "HomeMainController.h"
#import "MeetingApplyController.h"
#import "LoginController.h"
#import "MineController.h"
#import "VisitorsAppointController.h"
#import "VisitorsController.h"
#import "RepoirBackController.h"
#import "CarApplyController.h"
#import "WisdomRestLinePageController.h"
#import "NewsInfoController.h"
#import "AnnouncementController.h"

#import "ZQCycleView.h"
#import "SystemAnnouncementView.h"
#import "HomeMainView.h"
@interface HomeMainController ()<ZQCycleViewDelegate, HomeMainViewDelegate, SystemAnnouncementViewDelegate>



@end

@implementation HomeMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    [self setUpAdvertView];
    XBLog(@"---%@",[UserInfoManager getUserInfo].memberId);
}



- (void)setUpAdvertView {
    ZQCycleView *cycleView = [[ZQCycleView alloc] initWithframe:CGRectMake(0,0, SCREEN_WIDTH, 175) imageUrls:@[@"banner", @"banner", @"banner", @"banner"]delegate:self pageControColor:[UIColor whiteColor]];
        [self.view addSubview:cycleView];
    
    SystemAnnouncementView *systemInfo = [[SystemAnnouncementView alloc]init];
    systemInfo.delegate = self;
    systemInfo.backgroundColor = [UIColor whiteColor];
    XBViewBorderRadius(systemInfo, 10, 0, [UIColor clearColor]);
    [self.view addSubview:systemInfo];
    [systemInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cycleView.mas_bottom).offset(11);
        make.left.equalTo(self.view).offset(12);
        make.right.equalTo(self.view).offset(-12);
        make.height.mas_equalTo(64);
    }];
    
    HomeMainView *homeMainView = [[HomeMainView alloc]init];
    homeMainView.backgroundColor = [UIColor whiteColor];
    homeMainView.delegate = self;
    [self.view addSubview:homeMainView];
    [homeMainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(systemInfo.mas_bottom).offset(10);
        make.height.mas_equalTo(300);
    }];
    

}


- (void)selectMore {
    AnnouncementController *moreVC = [[AnnouncementController alloc]init];
    [self.navigationController pushViewController:moreVC animated:YES];
}

/**
 底部六个按钮的点击事件

 @param moudleType 对应模块
 */
- (void)selectHomeMoudleType:(HomeMoudleType)moudleType {
    switch (moudleType) {
        case HomeMoudleType_visitor:
        {
//            VisitorsController *vistorVC = [[VisitorsController alloc]init];
//            [self.navigationController pushViewController:vistorVC animated:YES];
            VisitorsAppointController *vistorVC = [[VisitorsAppointController alloc]init];
            [self.navigationController pushViewController:vistorVC animated:YES];
        }
            break;
        case HomeMoudleType_repairBack:
        {
            RepoirBackController *repoirBackVC = [[RepoirBackController alloc]init];
            [self.navigationController pushViewController:repoirBackVC animated:YES];
        }
            break;
        case HomeMoudleType_userCarApply:
        {
            CarApplyController *carApplyVC = [[CarApplyController alloc]init];
            [self.navigationController pushViewController:carApplyVC animated:YES];
        }
            break;
        case HomeMoudleType_meetApply:
        {
            MeetingApplyController *meetApplyVC = [[MeetingApplyController alloc]init];
            [self.navigationController pushViewController:meetApplyVC animated:YES];
        }
            break;
        case HomeMoudleType_wisdomFood:
        {
            WisdomRestLinePageController *wisdomResVC = [[WisdomRestLinePageController alloc]init];
            [self.navigationController pushViewController:wisdomResVC animated:YES];
        }
            break;
        case HomeMoudleType_newsInfo:
        {
            NewsInfoController *newsInfoVC = [[NewsInfoController alloc]init];
            [self.navigationController pushViewController:newsInfoVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    
}


- (void)cycleScrollView:(ZQCycleView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    XBLog(@"index: %zd", index);
}


- (void)setUpNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_home_mineCenter" highImageName:@"icon_home_mineCenter" target:self action:@selector(mineCenterAction)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_home_telephone" highImageName:@"icon_home_telephone" target:self action:@selector(mingePhoneAction)];
}

/**
 左上角头像点击事件
 */
- (void)mineCenterAction {
    MineController *mineVC = [[MineController alloc]init];
    [self.navigationController pushViewController:mineVC animated:YES];
}

/**
 右上角电话点击事件
 */
- (void)mingePhoneAction {
    LoginController *loginVC = [[LoginController alloc]init];
    [self.navigationController presentViewController:loginVC animated:YES completion:nil];
}



@end
