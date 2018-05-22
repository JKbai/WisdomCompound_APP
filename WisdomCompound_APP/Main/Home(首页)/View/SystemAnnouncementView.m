//
//  SystemAnnouncementView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "SystemAnnouncementView.h"

#import "XLsn0wTextCarousel.h"
#import "DataSourceModel.h"
@interface SystemAnnouncementView ()<TextInfoViewDelegate>


/** 系统公告的图片  */
@property (nonatomic,strong)UIImageView *img_systeminfo;


/** 跑马灯  */
@property (nonatomic,strong) XLsn0wTextCarousel *textCarousel;


/** 分割线  */
@property (nonatomic,strong) UIView *line;

/** 更多  */
@property (nonatomic,strong) UIButton *btn_more;


@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@end
@implementation SystemAnnouncementView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}


- (void)setUpUI {
    

    
    
    
    _img_systeminfo = ({
        UIImageView *systemInfo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_home_systemInfo"]];
        [self addSubview:systemInfo];
        systemInfo;
    });
    
    
    _textCarousel = ({
        self.dataSourceArray = [NSMutableArray array];
        NSArray *titleArray = @[@"西安市环境保护碑林分局行政处...", @"西安市环境保护碑林分局行政处...", @"西安市环境保护碑林分局行政处...", @"西安市环境保护碑林分局行政处..."];
        NSArray *URLArray = @[@"http://0", @"http://1", @"http://2", @"http://3"];
        
        for (int i = 0; i < titleArray.count; i++) {
            NSString *title = [titleArray objectAtIndex:i];
            NSString *URLString = [URLArray objectAtIndex:i];
            DataSourceModel *model = [DataSourceModel dataSourceModelWithType:nil title:title URLString:URLString];
            [self.dataSourceArray addObject:model];
        }
        XLsn0wTextCarousel *view = [[XLsn0wTextCarousel alloc] init];
        view.dataSourceArray = self.dataSourceArray;
        view.currentTextInfoView.xlsn0wDelegate = self;
        view.hiddenTextInfoView.xlsn0wDelegate = self;
        view.backgroundColor =[UIColor whiteColor];
        [self addSubview:view];
        view;
    });
    
    _line = ({
       
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"#555555"];
        [self addSubview:line];
        line;
    });
    
    _btn_more = ({
        UIButton *more = [UIButton buttonWithType:UIButtonTypeSystem];
        [more setTitleColor:[UIColor colorWithHexString:TextColor_33] forState:UIControlStateNormal];
        [more setTitle:@"更多" forState:UIControlStateNormal];
        more.titleLabel.font = FONT(12);
        [self addSubview:more];
        more;
    });
    
    
    
    
}


- (void)handleTopEventWithURLString:(NSString *)URLString {
    XBLog(@"URLString===%@", URLString);
}

- (void)getTopDataSourceModel:(DataSourceModel *)topDataSourceModel {
    XBLog(@"第一个 %@ %@ %@", topDataSourceModel.type, topDataSourceModel.title, topDataSourceModel.URLString);
}

- (void)getBottomDataSourceModel:(DataSourceModel *)bottomDataSourceModel {
    XBLog(@"第二个 %@ %@ %@", bottomDataSourceModel.type, bottomDataSourceModel.title, bottomDataSourceModel.URLString);
}

- (void)handleBottomEventWithURLString:(NSString *)URLString {
    XBLog(@"URLString===%@", URLString);
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img_systeminfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(63);
        make.height.mas_equalTo(15);
    }];
    
    [_btn_more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.width.mas_equalTo(40);
    }];
    
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btn_more.mas_left).offset(-5);
        make.top.equalTo(self).offset(25);
        make.bottom.equalTo(self).offset(-25);
        make.width.mas_equalTo(1);
        
    }];
    
    [_textCarousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.img_systeminfo.mas_right).offset(17);
        make.right.equalTo(self.line.mas_left).offset(-8);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
    }];
    
    
}


@end
