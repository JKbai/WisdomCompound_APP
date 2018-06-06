//
//  MeetingApplyController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/28.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MeetingApplyController.h"

#import "VisitorHeardView.h"
#import "IMJIETagFrame.h"
#import "IMJIETagView.h"
#import "RadioButton.h"
#import "BRStringPickerView.h"
#import "BRDatePickerView.h"
#import "NSDate+Extension.h"

@interface MeetingApplyController ()<IMJIETagViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *view_infoBg;
@property (weak, nonatomic) IBOutlet UITextView *textView_meetContent;
/** 提交  */
@property (nonatomic,strong) UIButton *btn_commit;
/** 参会单位  */
@property (nonatomic,strong) NSMutableArray *unitArray;
@end

@implementation MeetingApplyController


- (NSMutableArray *)unitArray {
    if (!_unitArray) {
        NSArray *array = @[@"单位一", @"单位二", @"单位三"];
        
        _unitArray = [NSMutableArray arrayWithArray:array];
    }
    return _unitArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _mark1.textColor = _mark2.textColor = _mark3.textColor = _mark4.textColor = _mark5.textColor = _mark6.textColor = _mark7.textColor = [UIColor colorWithHexString:MustMarkColor];
    _title1.textColor = _title2.textColor = _title3.textColor = _title4.textColor = _title5.textColor = _title6.textColor = _title7.textColor = _title8.textColor = _title9.textColor = _title10.textColor = _title11.textColor = [UIColor colorWithHexString:TextColor_66];
    _tv_endTime.delegate = _tv_startTime.delegate  = _tv_attendingUnit.delegate  = _tv_undertakeUnit.delegate = self;
    [_tv_undertakeUnit addTarget:self action:@selector(chooseUndertakeUnit)];
    [_tv_attendingUnit addTarget:self action:@selector(chooseattendingUnit)];
    [_tv_startTime addTarget:self action:@selector(chooseStartTime)];
    [_tv_endTime addTarget:self action:@selector(chooseEndTime)];
}



/**
 承办单位
 */
- (void)chooseUndertakeUnit {
    [BRStringPickerView showStringPickerWithTitle:nil dataSource:self.unitArray defaultSelValue:self.unitArray[0] isAutoSelect:NO resultBlock:^(id selectValue) {
        XBWeakSelf(self)
       weakself.tv_undertakeUnit.text = selectValue;
    }];
}


/**
 参会单位
 */
- (void)chooseattendingUnit {
    [BRStringPickerView showStringPickerWithTitle:nil dataSource:self.unitArray defaultSelValue:self.unitArray[0] isAutoSelect:NO resultBlock:^(id selectValue) {
        XBWeakSelf(self)
        weakself.tv_attendingUnit.text = selectValue;
    }];
}


- (void)chooseStartTime {
    XBWeakSelf(self)
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:[NSDate currentDateString] minDateStr:[NSDate currentDateString] maxDateStr:@"2018-10-10 10:20" isAutoSelect:NO resultBlock:^(NSString *selectValue) {
        weakself.tv_startTime.text = selectValue;
    }];
}


- (void)chooseEndTime {
    XBWeakSelf(self)
    [BRDatePickerView showDatePickerWithTitle:@"" dateType:UIDatePickerModeDateAndTime defaultSelValue:[NSDate currentDateString] minDateStr:[NSDate currentDateString] maxDateStr:@"2018-10-10 10:20" isAutoSelect:NO resultBlock:^(NSString *selectValue) {
      weakself.tv_endTime.text = selectValue;
    }];
}



/**
 是否使用投影仪
 */
- (void)onRadioButtonValueChangedWithProjection:(RadioButton*)sender {
    
}


/**
 是否使用主席台
 */
- (void)onRadioButtonValueChangedWithPodium:(RadioButton*)sender {
    
}


- (void)setUpUI {
    
    VisitorHeardView *heardView = [[VisitorHeardView alloc]init];
    [self.view addSubview:heardView];
    [heardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(76);
    }];
    
    
    UILabel *lab_meetService = [[UILabel alloc]init];
    lab_meetService.text = @"会服内容";
    lab_meetService.font = FONT(13);
    lab_meetService.textColor = [UIColor colorWithHexString:TextColor_66];
    [self.view_infoBg addSubview:lab_meetService];
    [lab_meetService mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view_infoBg.mas_left).offset(13);
        make.top.equalTo(self.textView_meetContent.mas_bottom).offset(16);
        make.height.mas_equalTo(13);
    }];
    self.textView_meetContent.backgroundColor = [UIColor colorWithHexString:TextViewBgColor];
    self.textView_meetContent.placeholder = @"请输入会议内容";
    
    
    
    NSArray *title1 = @[@"是", @"否"];
    NSMutableArray *buttons1 = [NSMutableArray arrayWithCapacity:title1.count];
    CGRect btnRect1 = CGRectMake(SCREEN_WIDTH - 150, 10, 120, 30);
    for (NSString *optionTitle in title1) {
        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect1];
        [btn addTarget:self action:@selector(onRadioButtonValueChangedWithProjection:) forControlEvents:UIControlEventValueChanged];
        btnRect1.origin.x += 60;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setImage:[UIImage imageNamed:@"icon_disSelectRadio"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"icon_selectRadio"] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [self.bg_projection addSubview:btn];
        [buttons1 addObject:btn];
    }
    
    [buttons1[0] setGroupButtons:buttons1];
    
    
    CGRect btnRect2 = CGRectMake(SCREEN_WIDTH - 150, 10, 120, 30);
    NSMutableArray *buttons2 = [NSMutableArray arrayWithCapacity:title1.count];
    for (NSString *optionTitle in title1) {
        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect2];
        [btn addTarget:self action:@selector(onRadioButtonValueChangedWithPodium:) forControlEvents:UIControlEventValueChanged];
        btnRect2.origin.x += 60;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setImage:[UIImage imageNamed:@"icon_disSelectRadio"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"icon_selectRadio"] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [self.bg_podium addSubview:btn];
        [buttons2 addObject:btn];
        [buttons2[0] setGroupButtons:buttons2];
    }
    
    
    
    NSArray *array = @[@"提供毛巾",@"提供毛巾脸盆",@"提供毛巾",@"提供毛巾", @"提供毛巾脸盆"];
    IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
    frame.tagsMinPadding = 3;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = array;
    
    IMJIETagView *tagView = [[IMJIETagView alloc] initWithFrame:CGRectMake(0, 590, SCREEN_WIDTH - 50, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickBackgroundColor = [UIColor colorWithHexString:MainBlueColor];
    tagView.clickTitleColor = [UIColor colorWithHexString:TextColor_ff];
    tagView.clickStart = 1;
    tagView.delegate = self;
    [self.view_infoBg addSubview:tagView];
    
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:OtherLineColor];
    [self.view_infoBg addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tagView.mas_bottom).offset(10);
        make.left.equalTo(self.view_infoBg.mas_left).offset(13);
        make.right.equalTo(self.view_infoBg.mas_right).offset(-13);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *lab_otherNeed = [[UILabel alloc]init];
    lab_otherNeed.text = @"其他特殊要求";
    lab_otherNeed.font = FONT(13);
    lab_otherNeed.textColor = [UIColor colorWithHexString:TextColor_66];
    [self.view_infoBg addSubview:lab_otherNeed];
    [lab_otherNeed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view_infoBg.mas_left).offset(13);
        make.top.equalTo(line.mas_bottom).offset(16);
        make.height.mas_equalTo(13);
    }];
    
    
    UITextView *textView_otherNeed = [[UITextView alloc]init];
    textView_otherNeed.placeholder = @"请输入其他特殊要求 如：有无省、市相关部门人员参会， 有无参会领导车辆需要进入大院停放等信息";
    textView_otherNeed.backgroundColor = [UIColor colorWithHexString:TextViewBgColor];
    [self.view_infoBg addSubview:textView_otherNeed];
    [textView_otherNeed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab_otherNeed.mas_bottom).offset(16);
        make.left.equalTo(self.view_infoBg.mas_left).offset(13);
        make.right.equalTo(self.view_infoBg.mas_right).offset(-13);
        make.height.mas_equalTo(104);
    }];
    
    
    [self.btn_commit setTitle:@"提    交" forState:UIControlStateNormal];
    
}

//会服内容点击事件
-(void)IMJIETagView:(NSArray *)tagArray {
    XBLog(@"%@", tagArray);
}

- (UIButton *)btn_commit {
    if (!_btn_commit) {
        _btn_commit  = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn_commit.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
        [_btn_commit setTitleColor:[UIColor colorWithHexString:TextColor_ff] forState:UIControlStateNormal];
        [_btn_commit addTarget:self action:@selector(commitAction)];
        XBViewBorderRadius(_btn_commit, 25, 0, [UIColor clearColor]);
        [self.contentView addSubview:_btn_commit];
        [_btn_commit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.left.equalTo(self.contentView).offset(13);
            make.right.equalTo(self.contentView).offset(-13);
            make.height.mas_equalTo(50);
        }];
    }
    return _btn_commit;
}

- (void)commitAction {
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.tv_attendingUnit || textField == self.tv_undertakeUnit || textField == self.tv_startTime || textField == self.tv_endTime) {
        return NO;
    }else {
        return YES;
    }
    
    
    
}


@end
