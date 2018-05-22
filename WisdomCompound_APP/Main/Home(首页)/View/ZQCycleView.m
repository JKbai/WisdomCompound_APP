//
//  ZQCycleView.m
//  GuiderView
//
//  Created by 张奇 on 2017/10/13.
//  Copyright © 2017年 bocweb. All rights reserved.
//

#import "ZQCycleView.h"
#import "UIView+Extension.h"
#import <UIImageView+WebCache.h>
@interface ZQCycleView() <UIScrollViewDelegate>
{
    CGFloat startContentOffsetX;
    CGFloat willEndContentOffsetX;
    CGFloat endContentOffsetX;
    UIColor *pageControlColor;
    //frame
    CGFloat bannerW;
    CGFloat bannerH;
}
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) NSMutableArray *btnXArray;
@property (nonatomic, copy) NSString *scrollDirection;
@property (nonatomic, assign) id<ZQCycleViewDelegate> delegate;
@end
static NSInteger const delayTime = 3;
//pageControl宽高
static NSInteger const normalbtnWH = 7.0;
//pageControl选中宽
static NSInteger const selectBtnWidth = 14.0;
//间距
static NSInteger const btnMargin = 14.0;

static NSInteger const pageControlMarginDown = 12;
@implementation ZQCycleView

- (instancetype)initWithframe:(CGRect)frame
                    imageUrls:(NSArray *)imageUrls
                     delegate:(id<ZQCycleViewDelegate>)delegate
              pageControColor:(UIColor*)pageControColor {
    if (self == [super initWithFrame:frame]) {
        bannerW = frame.size.width;
        bannerH = frame.size.height;
        pageControlColor = pageControColor;
        self.delegate = delegate;
        [self setupSubViewsWithImageUrls:imageUrls];
        [self addTimer];
    }
    return self;
}

- (void)setupSubViewsWithImageUrls:(NSArray *)imageUrls {
    //ScrollView
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, bannerW, bannerH)];
    _bgScrollView.pagingEnabled = YES;
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    _bgScrollView.bounces = NO;
    _bgScrollView.delegate = self;
    _bgScrollView.contentSize = CGSizeMake(bannerW*imageUrls.count, bannerH);
    [self addSubview:self.bgScrollView];
    
    //imageView
    for (int i = 0; i < imageUrls.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(bannerW*i, 0, bannerW, bannerH)];
        imageView.tag = 2000+i;
//        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrls[i]]];
        imageView.image = [UIImage imageNamed:imageUrls[i]];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImageViewWithTapGesture:)];
        [imageView addGestureRecognizer:tapGesture];
        [self.bgScrollView addSubview:imageView];
    }
    
    //按钮

    CGFloat X = (bannerW / 2)-((normalbtnWH+btnMargin)*(imageUrls.count-1)+selectBtnWidth)/2;
    CGFloat Y = bannerH-pageControlMarginDown;
    self.btnArray = [NSMutableArray arrayWithCapacity:imageUrls.count];
    self.btnXArray = [NSMutableArray arrayWithCapacity:imageUrls.count];
    for (int i = 0; i < imageUrls.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(X, Y, normalbtnWH, normalbtnWH);
        btn.layer.cornerRadius = normalbtnWH/2;
        btn.backgroundColor = pageControlColor;
        btn.alpha = 0.5;
        btn.tag = 1000+i;
        [self.btnXArray addObject:[NSString stringWithFormat:@"%f", btn.frame.origin.x]];
        [self addSubview:btn];
        [self.btnArray addObject:btn];
        if (0 == i) {
            btn.frame = CGRectMake(X, Y, selectBtnWidth, normalbtnWH);
            btn.alpha = 1.0;
            self.currentBtn = btn;
            X += btnMargin+normalbtnWH;
        } else {
            X += btnMargin;
        }
    }
}

- (void)addTimer {
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:delayTime target:self selector:@selector(scrollAnimation:) userInfo:nil repeats:YES];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollAnimation:(NSTimer *)timer {
    //画面从左往右移动，后一页
    [self animationWithIsRightDirection:YES isTimerAutomate:YES];
}

/**
 @param isRight 是否是向右滚动
 @param isTimerAutomate 是否是定时器导致的
 */
- (void)animationWithIsRightDirection:(BOOL)isRight isTimerAutomate:(BOOL)isTimerAutomate {
    [UIView animateWithDuration:1 animations:^{
        for (UIButton *tempBtn in self.btnArray) {
            if ([tempBtn isEqual:[self moveNextBtnWithDirection:isRight]]) {
                tempBtn.alpha = 1.0;
            } else {
                tempBtn.alpha = 0.5;
            }
        }
        
        if (isTimerAutomate) {
            if (self.currentBtn.tag == (1000+self.btnArray.count-1)) {
                for (UIButton *tempBtn in self.btnArray) {
                    tempBtn.x += (selectBtnWidth-normalbtnWH);
                }
            }
            self.currentBtn.width = normalbtnWH;
            UIButton *nextBtn = [self moveNextBtnWithDirection:isRight];
            nextBtn.width = selectBtnWidth;
            nextBtn.x -= (selectBtnWidth-normalbtnWH);
            self.currentBtn = [self moveNextBtnWithDirection:isRight];
            
            [self.bgScrollView setContentOffset:CGPointMake(bannerW*(self.currentBtn.tag-1000), 0) animated:YES];
        } else {
            self.currentBtn.width = normalbtnWH;
            UIButton *nextBtn = [self moveNextBtnWithDirection:isRight];
            nextBtn.width = selectBtnWidth;
            if (isRight) {
                nextBtn.x -= (selectBtnWidth-normalbtnWH);
            } else {
                self.currentBtn.x += (selectBtnWidth-normalbtnWH);
            }
            self.currentBtn = [self moveNextBtnWithDirection:isRight];
        }
    }];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //拖动前的起始坐标
    startContentOffsetX = scrollView.contentOffset.x;
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{    //将要停止前的坐标
    willEndContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    endContentOffsetX = scrollView.contentOffset.x;
    NSInteger currentOffsetX = scrollView.contentOffset.x;
    NSInteger currentIndex = floor(currentOffsetX/bannerW);
    NSLog(@"index: %ld", currentIndex);
    if (endContentOffsetX < willEndContentOffsetX && willEndContentOffsetX < startContentOffsetX) { //画面从右往左移动，前一页
        [self animationWithIsRightDirection:NO isTimerAutomate:NO];
    } else if (endContentOffsetX > willEndContentOffsetX && willEndContentOffsetX > startContentOffsetX) {
        //画面从左往右移动，后一页
        [self animationWithIsRightDirection:YES isTimerAutomate:NO];
    }
    
}


- (UIButton *)moveNextBtnWithDirection:(BOOL)isRight {
    if (isRight) {
        if (self.currentBtn.tag == (1000+self.btnArray.count-1)) {
            return self.btnArray.firstObject;
        } else {
            return [self viewWithTag:self.currentBtn.tag+1];
        }
    } else {
        if (self.currentBtn.tag == 1000) {
            return self.btnArray.lastObject;
        } else {
            return [self viewWithTag:self.currentBtn.tag-1];
        }
    }
}

/** 点击图片回调 */
- (void)clickImageViewWithTapGesture:(UITapGestureRecognizer *)tapGesture {
    UIImageView *imageView = (UIImageView*)tapGesture.view;
    NSInteger index = imageView.tag-2000;
    [self.delegate cycleScrollView:self didSelectItemAtIndex:index];
}


@end
