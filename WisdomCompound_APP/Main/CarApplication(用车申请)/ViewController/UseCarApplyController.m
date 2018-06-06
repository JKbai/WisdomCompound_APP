//
//  UseCarApplyController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/30.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "UseCarApplyController.h"
#import "VisitorHeardView.h"
#import "BRStringPickerView.h"
#import "BRDatePickerView.h"
#import "NSDate+Extension.h"
@interface UseCarApplyController ()<UITextFieldDelegate>
/** 提交  */
@property (nonatomic,strong) UIButton *btn_commit;

/** 用车单位  */
@property (nonatomic,strong) NSMutableArray *unitArray;

/** 用车原因  */
@property (nonatomic,strong) NSMutableArray *reasonArray;
@end

@implementation UseCarApplyController

- (NSMutableArray *)unitArray {
    if (!_unitArray) {
        NSArray *array = @[@"单位一", @"单位二", @"单位三"];
        
        _unitArray = [NSMutableArray arrayWithArray:array];
    }
    return _unitArray;
}

- (NSMutableArray *)reasonArray {
    if (!_reasonArray) {
        NSArray *array = @[@"原因一", @"原因二", @"原因三"];
        
        _reasonArray = [NSMutableArray arrayWithArray:array];
    }
    return _reasonArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用车申请";
    [self setUpUI];
}

/**
 选择用车单位
 */
- (void)chooseUseCarCompany {
    [BRStringPickerView showStringPickerWithTitle:nil dataSource:self.unitArray defaultSelValue:self.unitArray[0] isAutoSelect:NO resultBlock:^(id selectValue) {
        XBWeakSelf(self)
        weakself.tf_useCarCompany.text = selectValue;
    }];
}

/**
 选择用车事由
 */
- (void)chooseuseCarReason {
    [BRStringPickerView showStringPickerWithTitle:nil dataSource:self.reasonArray defaultSelValue:self.reasonArray[0] isAutoSelect:NO resultBlock:^(id selectValue) {
        XBWeakSelf(self)
        weakself.tf_useCarReason.text = selectValue;
    }];
}

/**
 选择开始时间
 */
- (void)chooseStartTime {
     XBWeakSelf(self)
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:[NSDate currentDateString] minDateStr:[NSDate currentDateString] maxDateStr:@"2018-10-10 10:20" isAutoSelect:NO resultBlock:^(NSString *selectValue) {
        weakself.tf_startTime.text = selectValue;
    }];
}
/**
 选择结束时间
 */
- (void)chooseEndTime {
    XBWeakSelf(self)
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:[NSDate currentDateString] minDateStr:[NSDate currentDateString] maxDateStr:@"2018-10-10 10:20" isAutoSelect:NO resultBlock:^(NSString *selectValue) {
        weakself.tf_endTime.text = selectValue;
    }];
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
    [visitorTitle_btn setTitle:@"用车信息" forState:UIControlStateNormal];
    [visitorTitle_btn setImage:[UIImage imageNamed:@"icon_other_useCar"] forState:UIControlStateNormal];
    visitorTitle_btn.backgroundColor = [UIColor clearColor];
    visitorTitle_btn.userInteractionEnabled = NO;
    [visitorTitle_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:12];
    [self.view addSubview:visitorTitle_btn];
    [visitorTitle_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.height.mas_equalTo(17);
        make.top.equalTo(heardView.mas_bottom).offset(14);
        
    }];

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
            make.bottom.equalTo(self.view.mas_bottom).offset(-10);
            make.left.equalTo(self.view).offset(13);
            make.right.equalTo(self.view).offset(-13);
            make.height.mas_equalTo(50);
        }];
    }
    return _btn_commit;
}

- (void)commitAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.mark1.textColor = self.mark2.textColor = self.mark4.textColor = self.mark5.textColor = [UIColor colorWithHexString:MustMarkColor];
    self.title1.textColor = self.title2.textColor = self.title3.textColor = self.title4.textColor = self.title5.textColor = [UIColor colorWithHexString:TextColor_66];
    self.tv_memo.backgroundColor = [UIColor colorWithHexString:TextViewBgColor];
    self.tv_memo.placeholder = @"请输入相关备注";
    self.mark3.hidden = YES;
    [_tf_useCarCompany addTarget:self action:@selector(chooseUseCarCompany)];
    [_tf_useCarReason addTarget:self action:@selector(chooseuseCarReason)];
    [_tf_startTime addTarget:self action:@selector(chooseStartTime)];
    [_tf_endTime addTarget:self action:@selector(chooseEndTime)];
    
    
    self.tf_useCarCompany.delegate =  self.tf_useCarReason.delegate = self.tf_carPlatNo.delegate = self.tf_startTime.delegate = self.tf_endTime.delegate = self;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.tf_useCarCompany || textField == self.tf_useCarReason || textField == self.tf_startTime || textField == self.tf_endTime || self.tf_carPlatNo) {
        return NO;
    }else {
        return YES;
    }

}

@end
