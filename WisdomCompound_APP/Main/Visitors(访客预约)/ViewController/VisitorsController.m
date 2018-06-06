//
//  VisitorsController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "VisitorsController.h"
#import "VisitorHeardView.h"
#import "VisitorInfoView.h"

#import "SelwynFormSectionItem.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"

@interface VisitorsController ()


/** 信息View  */
@property (nonatomic,strong) VisitorInfoView *infoView;
/** 提交  */
@property (nonatomic,strong) UIButton *btn_commit;





@end

@implementation VisitorsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"访客预约";
        [self setUpUI];
}

- (void)setUpUI {
    
    VisitorHeardView *heardView = [[VisitorHeardView alloc]init];
    [self.view addSubview:heardView];
    [heardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(76);
    }];
    
    UIButton *visitorTitle_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    visitorTitle_btn.titleLabel.font = FONT(15);
    [visitorTitle_btn setTitleColor:[UIColor colorWithHexString:TextColor_33] forState:UIControlStateNormal];
    [visitorTitle_btn setTitle:@"访客信息" forState:UIControlStateNormal];
    [visitorTitle_btn setImage:[UIImage imageNamed:@"icon_other_userInfo"] forState:UIControlStateNormal];
    visitorTitle_btn.backgroundColor = [UIColor clearColor];
    visitorTitle_btn.userInteractionEnabled = NO;
    [visitorTitle_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:12];
    [self.view addSubview:visitorTitle_btn];
    [visitorTitle_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.height.mas_equalTo(17);
        make.top.equalTo(heardView.mas_bottom).offset(14);
        
    }];
    
    
    VisitorInfoView *infoView = [[VisitorInfoView alloc]init];
    [self.view addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(heardView.mas_bottom).offset(44);
        make.left.equalTo(self.view).offset(12);
        make.right.equalTo(self.view).offset(-12);
        make.height.mas_equalTo(367);
    }];
    self.infoView = infoView;
    
    
    [self.btn_commit setTitle:@"提     交" forState:UIControlStateNormal];
}






- (UIButton *)btn_commit {
    if (!_btn_commit) {
        _btn_commit  = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn_commit.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
        [_btn_commit setTitleColor:[UIColor colorWithHexString:TextColor_ff] forState:UIControlStateNormal];
        [_btn_commit addTarget:self action:@selector(commitAction)];
        XBViewBorderRadius(_btn_commit, 25, 0, [UIColor clearColor]);
        [self.view addSubview:_btn_commit];
        [_btn_commit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoView.mas_bottom).offset(23);
            make.left.equalTo(self.view).offset(13);
            make.right.equalTo(self.view).offset(-13);
            make.height.mas_equalTo(50);
        }];
    }
    return _btn_commit;
}

- (void)commitAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
