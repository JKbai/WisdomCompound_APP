//
//  WisdomRestLinePageController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/25.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "WisdomRestLinePageController.h"
#import "WisdomRestController.h"
#import "CJCalendarViewController.h"
#import "NSDate+Extension.h"
@interface WisdomRestLinePageController ()<CalendarViewControllerDelegate>

/** 状态数组  */
@property (nonatomic,strong) NSArray *titleArray;


/** 日历按钮  */
@property (nonatomic,strong) UIButton *btn_calendar;

@end

@implementation WisdomRestLinePageController

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"早餐",@"午餐", @"晚餐"];
    }
    return _titleArray;
    
}

-(void)loadView
{
    [super loadView];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.menuViewLayoutMode =  WMMenuViewLayoutModeLeft;
    self.titleColorSelected = [UIColor colorWithHexString:MainBlueColor];
    self.progressViewIsNaughty = YES;
    self.progressWidth = 50;
    self.selectIndex = 0;
    self.automaticallyCalculatesItemWidths = YES;
    
    [self btn_calendar];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithName:@"文明用餐" font:12 target:self action:@selector(dininRulesAction)];
    self.title = @"智慧餐厅";
}


- (void)dininRulesAction {
    
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    WisdomRestController *wisdomRestVC =  [[WisdomRestController alloc] init];
    wisdomRestVC.breakfastType = index;
    return wisdomRestVC;
    
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    return CGRectMake(0, 0,200, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

- (UIButton *)btn_calendar {
    
    if (!_btn_calendar) {
        _btn_calendar = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_calendar.frame = CGRectMake(SCREEN_WIDTH - 100, 0, 90, 44);
        _btn_calendar.titleLabel.font = FONT(12);
        [_btn_calendar setImage:[UIImage imageNamed:@"icon_meet_calendar"] forState:UIControlStateNormal];
        [_btn_calendar addTarget:self action:@selector(calendarbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btn_calendar setTitleColor:[UIColor colorWithHexString:MainBlueColor] forState:UIControlStateNormal];
        
        //用于界面展示
        NSString *dateStr1 = [NSDate  currentDateStringWithFormat:@"yyyy-MM-dd"];
        NSString *dateStr = [NSDate currentDateStringWithFormat:@"MM-dd"];
        //星期
        NSString *week = [NSDate getWeekDay:dateStr1];
        
        [_btn_calendar setTitle:[NSString stringWithFormat:@"%@ %@", week, dateStr] forState:UIControlStateNormal];
        [self.view addSubview:_btn_calendar];
        [_btn_calendar layoutButtonWithEdgeInsetsStyle:1 imageTitleSpace:5];
 
        
    }
    return _btn_calendar;
    
}

- (void)calendarbtnClick:(UIButton *)sender {
    self.btn_calendar = sender;
    CJCalendarViewController *calendarController = [[CJCalendarViewController alloc] init];
    calendarController.headerBackgroundColor = [UIColor colorWithHexString:MainBlueColor];
    calendarController.contentBackgroundColor = [UIColor colorWithHexString:MainBlueColor];
    [calendarController setBgAlpha:0.6 color:[UIColor blackColor]];
    calendarController.view.frame = self.view.frame;
    calendarController.delegate = self;
    [self presentViewController:calendarController animated:YES completion:nil];
}

-(void)CalendarViewController:(CJCalendarViewController *)controller didSelectActionYear:(NSString *)year month:(NSString *)month day:(NSString *)day{

    //用于后台数据传参
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@",year, month, day];
    //用于界面展示
    NSString *dateStr1 = [NSString stringWithFormat:@"%@-%@", month, day];
    //星期
    NSString *week = [NSDate getWeekDay:dateStr];
    
    [self.btn_calendar setTitle:[NSString stringWithFormat:@"%@ %@",  week, dateStr1] forState:UIControlStateNormal];

}





@end
