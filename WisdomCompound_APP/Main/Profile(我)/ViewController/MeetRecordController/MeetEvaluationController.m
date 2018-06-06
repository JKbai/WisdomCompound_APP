//
//  MeetEvaluationController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/2.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "MeetEvaluationController.h"
#import "XBStarRateView.h"
@interface MeetEvaluationController ()




/** 咨询登记评分  */
@property (nonatomic,copy) NSString *starReteScore1;

/** 会场布置评分  */
@property (nonatomic,copy) NSString *starReteScore2;

/** 会场应兵评分  */
@property (nonatomic,copy) NSString *starReteScore3;

/** 会场指示评分  */
@property (nonatomic,copy) NSString *starReteScore4;

/** 会场设备评分  */
@property (nonatomic,copy) NSString *starReteScore5;

/** 茶水加水评分  */
@property (nonatomic,copy) NSString *starReteScore6;

/** 会场卫生评分  */
@property (nonatomic,copy) NSString *starReteScore7;

/** 会场送宾评分  */
@property (nonatomic,copy) NSString *starReteScore8;

/** 满意程度字符数组  */
@property (nonatomic,strong) NSArray *satisfactionArray;
@end

@implementation MeetEvaluationController


- (NSArray *)satisfactionArray {
    if (!_satisfactionArray) {
        _satisfactionArray = @[@"很差", @"不满意", @"满意", @"较满意", @"非常满意"];
    }
    return _satisfactionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}




- (IBAction)commitAction:(UIButton *)sender {
}



- (void)setUI {
    
    XBWeakSelf(self)
    //咨询登记服务
    XBStarRateView *starView1 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore1 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score = [weakself.starReteScore1 integerValue];
        if (score >2) {
            weakself.lab_title1.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title1.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title1.text = weakself.satisfactionArray[score-1];
    }];
    starView1.enable = YES;
    [_bg_consultStarView addSubview:starView1];
    
    //会场布置服务
    XBStarRateView *starView2 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore2 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.starReteScore2 integerValue];
        if (score1 >2) {
            weakself.lab_title2.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title2.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title2.text = weakself.satisfactionArray[score1-1];
    }];
    starView2.enable = YES;
    [_bg_meetDecorateStarView addSubview:starView2];
    
    //会场迎宾服务
    XBStarRateView *starView3 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore3 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.starReteScore3 integerValue];
        if (score1 >2) {
            weakself.lab_title3.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title3.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title3.text = weakself.satisfactionArray[score1-1];
    }];
    starView3.enable = YES;
    [_bg_meetWelcomeStarView addSubview:starView3];
    
    
    //会场指示服务
    XBStarRateView *starView4 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore4 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score = [weakself.starReteScore4 integerValue];
        if (score >2) {
            weakself.lab_title4.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title4.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title4.text = weakself.satisfactionArray[score-1];
    }];
    starView4.enable = YES;
    [_bg_meetInstructionsSatrView addSubview:starView4];
    
    //会场设备服务
    XBStarRateView *starView5 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore5 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.starReteScore5 integerValue];
        if (score1 >2) {
            weakself.lab_title5.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title5.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title5.text = weakself.satisfactionArray[score1-1];
    }];
    starView5.enable = YES;
    [_bg_meetEquipmentStarView addSubview:starView5];
    
    //茶水加水服务
    XBStarRateView *starView6 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore6 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.starReteScore6 integerValue];
        if (score1 >2) {
            weakself.lab_title6.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title6.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title6.text = weakself.satisfactionArray[score1-1];
    }];
    starView6.enable = YES;
    [_bg_meetTeaStarView addSubview:starView6];
    
    
    
    //会场卫生状况
    XBStarRateView *starView7 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore7 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score = [weakself.starReteScore7 integerValue];
        if (score >2) {
            weakself.lab_title7.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title7.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title7.text = weakself.satisfactionArray[score-1];
    }];
    starView7.enable = YES;
    [_bg_meetHealthStarView addSubview:starView7];
    
    //会场送宾服务
    XBStarRateView *starView8 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.starReteScore8 = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.starReteScore8 integerValue];
        if (score1 >2) {
            weakself.lab_title8.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.lab_title8.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.lab_title8.text = weakself.satisfactionArray[score1-1];
    }];
    starView8.enable = YES;
    [_bg_meetSendPennStarView addSubview:starView8];
    
}



- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _lab_meetNo.textColor = [UIColor colorWithHexString:MainBlueColor];
    _lab_status.textColor = [UIColor colorWithHexString:TextColor_33];
    
    _lab_mainTitle.textColor = [UIColor colorWithHexString:TextColor_33];
    _lab_subTitle.textColor = [UIColor colorWithHexString:TextColor_99];
    
    _lab_starTitle1.textColor = _lab_starTitle2.textColor = _lab_starTitle3.textColor =  _lab_starTitle4.textColor = _lab_starTitle5.textColor = _lab_starTitle6.textColor = _lab_starTitle7.textColor =_lab_starTitle8.textColor =  [UIColor colorWithHexString:TextColor_66];
    
    _btn_commit.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
    XBViewBorderRadius(_btn_commit, 22,0, [UIColor clearColor]);
    
    _tv_memo.placeholder = @"您的意见很重要！来点评一下吧...";
    _tv_memo.backgroundColor = [UIColor colorWithHexString:TextViewBgColor];
    //    _starEvluaTitle1.text = _starEvluaTitle2.text = _starEvluaTitle3.text = @"";
}

@end
