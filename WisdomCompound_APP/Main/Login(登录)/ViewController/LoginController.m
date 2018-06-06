//
//  LoginController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "LoginController.h"
#import "LoginTopView.h"
#import "LoginAcountView.h"

@interface LoginController ()


/** 立即登录按钮  */
@property (nonatomic,strong) UIButton *btn_login;



/** 登录账号View  */
@property (nonatomic,strong) LoginAcountView *loginAcountView;

/** 用户须知  */
@property (nonatomic, strong)UIButton *btn_agreement;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
}

- (void)setUpUI {
    
    LoginTopView *topView = [[LoginTopView alloc]init];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(228);
    }];
    
    
    LoginAcountView *acountView = [[LoginAcountView alloc]init];
    [self.view addSubview:acountView];
    [acountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(182);
    }];
    self.loginAcountView = acountView;
    
    [self.btn_login setTitle:@"立即登录" forState:UIControlStateNormal];
    [self btn_agreement];
}

/**
 登录按钮的点击事件
 */
- (void)loginAction {
    
    NSDictionary *params = @{
                             
                             @"mobilePhone" : self.loginAcountView.tf_phone.text,
                             @"veCode" : self.loginAcountView.tf_code.text,
                             
                             };
    
    [XBNetwork POSTWithURL:k_api_login parameters:params cachePolicy:0 callback:^(id responseObject, NSError *error) {
        if ([responseObject[@"code"] intValue] == 1) {
            
            
            UseInfoModel *model = [UseInfoModel yy_modelWithJSON:responseObject[@"data"]];
            [UserInfoManager setUserInfoWithInfo:model];
            if (![UserInfoManager isLogin]) {
                //登录成功
                [self dismissViewControllerAnimated:YES completion:^{
                }];
            }else {
                
            }
         
        }
    }];
    

  
}

//用户须知
- (void)agreementAction {
    
}


- (UIButton *)btn_login {
    if (!_btn_login) {
        _btn_login  = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn_login.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
        [_btn_login setTitleColor:[UIColor colorWithHexString:TextColor_ff] forState:UIControlStateNormal];
        [_btn_login addTarget:self action:@selector(loginAction)];
        XBViewBorderRadius(_btn_login, 25, 0, [UIColor clearColor]);
        [self.view addSubview:_btn_login];
        [_btn_login mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.loginAcountView.mas_bottom);
            make.left.equalTo(self.view).offset(13);
            make.right.equalTo(self.view).offset(-13);
            make.height.mas_equalTo(50);
        }];
    }
    return _btn_login;
}

- (UIButton *)btn_agreement {
    
    if (!_btn_agreement) {
        _btn_agreement = [UIButton buttonWithType:UIButtonTypeSystem];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"碑林区智慧大院《用户须知》"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:TextColor_66] range:NSMakeRange(0,7)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:MainBlueColor] range:NSMakeRange(7,6)];
        
        [_btn_agreement setAttributedTitle:str forState:UIControlStateNormal];
        [_btn_agreement setTitleColor:[UIColor colorWithHexString:MainBlueColor] forState:UIControlStateNormal];
        _btn_agreement.titleLabel.font = FONT(13);
        [_btn_agreement addTarget:self action:@selector(agreementAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.btn_agreement];
        [_btn_agreement mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-18);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }
    
    return _btn_agreement;
}

@end
