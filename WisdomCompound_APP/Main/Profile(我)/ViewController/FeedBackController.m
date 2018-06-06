//
//  FeedBackController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "FeedBackController.h"



@interface FeedBackController ()


/**   */
@property (nonatomic,strong) UITextView *feeBackTextView;
/** 提交  */
@property (nonatomic,strong) UIButton *btn_commit;
@end

@implementation FeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要反馈";
    
    [self feeBackTextView];
      [self.btn_commit setTitle:@"提     交" forState:UIControlStateNormal];
    
}



- (UITextView *)feeBackTextView {
    if (!_feeBackTextView) {
        _feeBackTextView = [[UITextView alloc]init];
        _feeBackTextView.placeholder = @"请输入您要反馈的内容";
        XBViewBorderRadius(_feeBackTextView, 1, 1, [UIColor colorWithHexString:OtherLineColor]);
        [self.view addSubview:_feeBackTextView];
        [_feeBackTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(10);
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.mas_equalTo(110);
            
        }];
    }
    return _feeBackTextView;
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
            make.bottom.equalTo(self.view.mas_bottom).offset(-10);
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
