//
//  VisitorsAppointController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/23.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "VisitorsAppointController.h"
#import "VisitorHeardView.h"

#import "SelwynFormSectionItem.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"

#import "BRStringPickerView.h"
#import "BRDatePickerView.h"
#import "NSDate+Extension.h"
@interface VisitorsAppointController ()


/** 提交  */
@property (nonatomic,strong) UIButton *btn_commit;

/** 到访理由数据源  */
@property (nonatomic,strong) NSMutableArray *visitorArray;


/** 到访事由字符串数据  */
@property (nonatomic,strong) NSMutableArray *reasonArray;


/** 访客姓名  */
@property (nonatomic,strong) SelwynFormItem *visitorNameItem;

//访客电话
@property (nonatomic,strong) SelwynFormItem *visitorPhoneItem;

//身份证号
@property (nonatomic,strong) SelwynFormItem *visitorIdCardItem;

//到访时间
@property (nonatomic,copy) NSString *visitTime;

//到访人数
@property (nonatomic,strong) SelwynFormItem *visitorNumItem;

//选中的事由id
@property (nonatomic,copy) NSString *visitReasonId;

//车牌号
@property (nonatomic,strong) SelwynFormItem *carPlateNoItem;




@end

@implementation VisitorsAppointController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithName:@"安保制度" font:12 target:self action:@selector(securitySystemAction)];
    [self setUI];
    
    NSArray *visitVo = [[CommonControlCache shareCommoncontrol] listFromDBForVisitreason];
    
    self.visitorArray = [NSMutableArray arrayWithArray:visitVo];
    self.reasonArray = [[NSMutableArray alloc]init];
    for (Visitreasonvos *model in self.visitorArray) {
        [self.reasonArray addObject:model.visitReason];
    }
    
}


/**
 安保制度的点击事件
 */
- (void)securitySystemAction {
    
}



- (void)visitorPickerViewWithSelwynFormItem:(SelwynFormItem *)selwynFormItem {
    XBWeakSelf(self)
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:[NSDate currentDateString] minDateStr:[NSDate currentDateString] maxDateStr:@"2018-10-10 10:20" isAutoSelect:NO resultBlock:^(NSString *selectValue) {
        selwynFormItem.formDetail = selectValue;
        weakself.visitTime = selectValue;
        [weakself.formTableView reloadData];
    }];
}



/**
 到访理由PickView
 */
- (void)visitorReasonPickerViewWithSelwynFormItem:(SelwynFormItem *)selwynFormItem {
    XBWeakSelf(self)
    [BRStringPickerView showStringPickerWithTitle:nil dataSource:self.reasonArray defaultSelValue:self.reasonArray[0] isAutoSelect:NO resultBlock:^(id selectValue) {
      selwynFormItem.formDetail = selectValue;
        for (Visitreasonvos *model in self.visitorArray) {
            if ([selectValue isEqualToString:model.visitReason]) {
                weakself.visitReasonId = model.visitReasonId;
            }
        }
      [weakself.formTableView reloadData];
    }];
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



/**
 提交按钮的点击事件
 */
- (void)commitAction {
    if (![self errorRemind]) {
        NSDictionary *params = @{
                                 
                                 @"visitorName" :  self.visitorNameItem.formDetail,
                                 @"visitorPhone" :  self.visitorPhoneItem.formDetail,
                                 @"visitorIdCard": self.visitorIdCardItem.formDetail,
                                 @"visitTime" : self.visitTime,
                                 @"visitorNum" :  self.visitorNumItem.formDetail,
                                 @"visitReasonId" : self.visitReasonId,
                                 @"carPlateNo" : self.carPlateNoItem.formDetail,
                                 @"memberId" : [UserInfoManager getUserInfo].memberId,
                                 };
        
        [XBNetwork POSTWithURL:k_api_visitorApplication parameters:params cachePolicy:0 callback:^(id responseObject, NSError *error) {
            if ([responseObject[@"code"] intValue] == 1) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            
            
        }];
    }
}
   



- (BOOL)errorRemind {
    [self.formTableView reloadData];
    if ([self.visitorNumItem.formDetail isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请输入姓名"];
        return YES;
    }
    else if ([self.visitorPhoneItem.formDetail isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请输入手机号"];
         return YES;
    }
    else if (![NSString checkMobile:self.visitorPhoneItem.formDetail]) {
        [HUDHelper showToastWithMessage:@"您输入的手机号格式有误,请重新输入"];
         return YES;
    }
    else if ([self.visitTime isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请选择到访时间"];
        return YES;
    }
    else if ([self.visitorIdCardItem.formDetail isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请输入手机号"];
         return YES;
    }
    else if (![NSString checkUserIdCard:self.visitorIdCardItem.formDetail]) {
        [HUDHelper showToastWithMessage:@"您输入的身份账号格式有误,请重新输入"];
         return YES;
    }
    else if ([self.visitorNumItem.formDetail isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请输入到访人数"];
         return YES;
    }
    else if ([self.visitReasonId isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请选择到访事由"];
        return YES;
    }
    
    
    return NO;
    
}

- (void)setUI{
    
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
    
    
    NSMutableArray *datas = [NSMutableArray array];
    
    SelwynFormItem *name = SelwynItemMake(@"姓名", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, YES);
    name.placeholder = @"请输入姓名";
    [datas addObject:name];
    self.visitorNameItem = name;
    
    
    SelwynFormItem *phoneNumber = SelwynItemMake(@"手机号", @"", SelwynFormCellTypeInput, UIKeyboardTypeNumberPad, YES, YES);
    phoneNumber.placeholder = @"请输入手机号";
    phoneNumber.maxInputLength = 11;    //添加字数限制
    [datas addObject:phoneNumber];
    self.visitorPhoneItem = phoneNumber;
    
    SelwynFormItem *idCardNumber = SelwynItemMake(@"身份证号", @"", SelwynFormCellTypeInput, UIKeyboardTypeNumberPad, YES, YES);
    idCardNumber.placeholder = @"请输入身份证号";
    idCardNumber.maxInputLength = 18;    //添加字数限制
    [datas addObject:idCardNumber];
     self.visitorIdCardItem = idCardNumber;
    
    SelwynFormItem *visitorTime = SelwynItemMake(@"到访时间", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, YES);
    visitorTime.selectHandle = ^(SelwynFormItem *item) {
        
        [self visitorPickerViewWithSelwynFormItem:item];
    };
    visitorTime.placeholder = @"请选择到访时间";
    [datas addObject:visitorTime];
    
    SelwynFormItem *visitorNumber = SelwynItemMake(@"到访人数", @"", SelwynFormCellTypeInput, UIKeyboardTypeNumberPad, YES, YES);
    visitorNumber.placeholder = @"请输入访人数";
    visitorNumber.maxInputLength = 3;
    [datas addObject:visitorNumber];
     self.visitorNumItem = visitorNumber;
    
    SelwynFormItem *visitorReason = SelwynItemMake(@"到访理由", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, YES);
    visitorReason.placeholder = @"请选择到访理由";
    visitorReason.selectHandle = ^(SelwynFormItem *item) {
        [self visitorReasonPickerViewWithSelwynFormItem:item];
    
    };
    [datas addObject:visitorReason];
    
    
    SelwynFormItem *carPlatNo = SelwynItemMake(@"车牌号", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    carPlatNo.maxInputLength = 10;
    carPlatNo.placeholder = @"请输入车牌号";
    [datas addObject:carPlatNo];
    self.carPlateNoItem = carPlatNo;
    
    SelwynFormSectionItem *sectionItem = [[SelwynFormSectionItem alloc]init];
    sectionItem.cellItems = datas;
    
    [self.mutableArray addObject:sectionItem];
    
    [self.btn_commit setTitle:@"提     交" forState:UIControlStateNormal];
    
}


@end
