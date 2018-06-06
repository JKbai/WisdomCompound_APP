//
//  RepoirBackController.m
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "RepoirBackController.h"
#import "VisitorHeardView.h"
#import "SelwynFormSectionItem.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"

#import "BRStringPickerView.h"

@interface RepoirBackController ()
/** 维修项目数据源  */
@property (nonatomic,strong) NSMutableArray *repoirProjectArray;
/** 提交  */
@property (nonatomic,strong) UIButton *btn_commit;
@end

@implementation RepoirBackController

- (NSMutableArray *)repoirProjectArray {
    if (!_repoirProjectArray) {
        _repoirProjectArray = [NSMutableArray arrayWithArray:@[@"维修项目一", @"维修项目二", @"维修项目三", @"维修项目四"]];
    }
    return _repoirProjectArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报修反馈";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithName:@"报修规则" font:12 target:self action:@selector(repoirRulesAction)];
    [self setUpUI];
}


/**
 报修规则
 */
- (void)repoirRulesAction {
    
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
    [visitorTitle_btn setTitle:@"维修信息" forState:UIControlStateNormal];
    [visitorTitle_btn setImage:[UIImage imageNamed:@"icon_other_repaire"] forState:UIControlStateNormal];
    visitorTitle_btn.backgroundColor = [UIColor clearColor];
    visitorTitle_btn.userInteractionEnabled = NO;
    [visitorTitle_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:12];
    [self.view addSubview:visitorTitle_btn];
    [visitorTitle_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.height.mas_equalTo(17);
        make.top.equalTo(heardView.mas_bottom).offset(14);
        
    }];
    
    self.tableViewHeight = SCREENH_HEIGHT;
    NSMutableArray *datas = [NSMutableArray array];
    
    SelwynFormItem *repoirProject = SelwynItemMake(@"维修项目", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, YES);
    repoirProject.placeholder = @"请选择维修项目";
    repoirProject.selectHandle = ^(SelwynFormItem *item) {
        [self repoirPickerViewWithSelwynFormItem:item];
    };
    [datas addObject:repoirProject];
    
    SelwynFormItem *address = SelwynItemMake(@"园区地址", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, YES);
    address.placeholder = @"请输入园区地址";
    [datas addObject:address];
    
    SelwynFormItem *content = SelwynItemMake(@"详细内容", @"", SelwynFormCellTypeTextViewInput, UIKeyboardTypeDefault, YES, NO);
    content.placeholder = @"为保证您的问题及时解决请输入报修内容尽可能详细一些";
    [datas addObject:content];
    
    SelwynFormItem *attachment = SelwynItemMake(@"附件", @"", SelwynFormCellTypeAttachment, UIKeyboardTypeDefault, YES, NO);
    attachment.maxImageCount = 9;
    attachment.editable = YES;
     [datas addObject:attachment];
    
    SelwynFormSectionItem *sectionItem = [[SelwynFormSectionItem alloc]init];
    sectionItem.cellItems = datas;
    
    [self.mutableArray addObject:sectionItem];
    
    
    [self.btn_commit setTitle:@"提     交" forState:UIControlStateNormal];
}


/**
 到访理由PickView
 */
- (void)repoirPickerViewWithSelwynFormItem:(SelwynFormItem *)selwynFormItem {
    [BRStringPickerView showStringPickerWithTitle:nil dataSource:self.repoirProjectArray defaultSelValue:self.repoirProjectArray[0] isAutoSelect:NO resultBlock:^(id selectValue) {
        XBWeakSelf(self)
        selwynFormItem.formDetail = selectValue;
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

- (void)commitAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
