//
//  EvaluationController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/31.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "EvaluationController.h"
#import "XBStarRateView.h"
@interface EvaluationController ()


/** 响应速度评分  */
@property (nonatomic,strong) NSString *responseStar;

/** 处理进度评分  */
@property (nonatomic,strong) NSString *progressStar;

/** 服务态度评分  */
@property (nonatomic,strong) NSString *serviceStar;


/** 满意程度字符数组  */
@property (nonatomic,strong) NSArray *satisfactionArray;

@end

@implementation EvaluationController


- (NSArray *)satisfactionArray {
    if (!_satisfactionArray) {
        _satisfactionArray = @[@"很差", @"不满意", @"满意", @"较满意", @"非常满意"];
    }
    return _satisfactionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评价";
    [self setUI];
}

- (void)setUI {

    XBWeakSelf(self)
    //响应速度
    XBStarRateView *starView1 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.responseStar = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score = [weakself.responseStar integerValue];
        if (score >2) {
            weakself.starEvluaTitle1.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.starEvluaTitle1.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.starEvluaTitle1.text = weakself.satisfactionArray[score-1];
    }];
    starView1.enable = YES;
    [_StarBgView1 addSubview:starView1];
    
     //处理速度
    XBStarRateView *starView2 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.progressStar = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.progressStar integerValue];
        if (score1 >2) {
            weakself.starEvluaTitle2.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.starEvluaTitle2.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.starEvluaTitle2.text = weakself.satisfactionArray[score1-1];
    }];
    starView2.enable = YES;
    [_starBgView2 addSubview:starView2];
    
    //服务态度
    XBStarRateView *starView3 = [[XBStarRateView alloc]initWithFrame:CGRectMake(120, 6, SCREEN_WIDTH - 227, 25) numberOfStars:5 rateStyle:WholeStar isAnination:YES finish:^(CGFloat currentScore) {
        weakself.serviceStar = [NSString stringWithFormat:@"%.f", currentScore];
        NSInteger score1 = [weakself.serviceStar integerValue];
        if (score1 >2) {
            weakself.starEvluaTitle3.textColor = [UIColor colorWithHexString:@"#15DB00"];
        }else {
            weakself.starEvluaTitle3.textColor = [UIColor colorWithHexString:@"#FF0101"];
        }
        weakself.starEvluaTitle3.text = weakself.satisfactionArray[score1-1];
    }];
    starView3.enable = YES;
    [_starBgView3 addSubview:starView3];
    
    

    
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _lab_serialNumber.textColor = [UIColor colorWithHexString:MainBlueColor];
    _lab_statues.textColor = [UIColor colorWithHexString:TextColor_33];
    
    _title1.textColor = [UIColor colorWithHexString:TextColor_33];
    _subtitle.textColor = [UIColor colorWithHexString:TextColor_99];
    
    _starTitle1.textColor = _starTitle2.textColor = _starTitle3.textColor = [UIColor colorWithHexString:TextColor_66];
    
    _tv_memo.placeholder = @"您的意见很重要！来点评一下吧...";
    _tv_memo.backgroundColor = [UIColor colorWithHexString:TextViewBgColor];
//    _starEvluaTitle1.text = _starEvluaTitle2.text = _starEvluaTitle3.text = @"";
}



- (IBAction)commitAction:(UIButton *)sender {
    
    XBLog(@"----%@-----%@----%@",self.responseStar, self.progressStar, self.serviceStar);
    
    
}
@end
