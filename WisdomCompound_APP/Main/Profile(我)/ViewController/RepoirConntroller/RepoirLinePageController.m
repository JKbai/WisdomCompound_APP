//
//  RepoirLinePageController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/25.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "RepoirLinePageController.h"
#import "RepoirRecordController.h"
@interface RepoirLinePageController ()
/** 状态数组  */
@property (nonatomic,strong) NSArray *titleArray;
@end

@implementation RepoirLinePageController
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"待处理",@"处理中", @"已处理"];
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"报修记录";
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    RepoirRecordController *repoirRecordVC =  [[RepoirRecordController alloc] init];
    repoirRecordVC.repoirStatues = index;
    return repoirRecordVC;
    
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    return CGRectMake(0, 0, self.view.frame.size.width, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

@end
