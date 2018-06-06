//
//  LoginAcountView.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "LoginAcountView.h"
#import "CountDownButton.h"
#import "NSString+Extension.h"

@interface LoginAcountView ()<UITextFieldDelegate>
/** 账号  */
@property (nonatomic,strong) UIImageView *img_phone;

/** 下划线  */
@property (nonatomic,strong) UIView *line1;

/** 验证码  */
@property (nonatomic,strong) UIImageView *img_code;

/** 下划线  */
@property (nonatomic,strong) UIView *line2;

/** 获取验证码按钮  */
@property (nonatomic,strong) CountDownButton *btn_getCode;

@end

@implementation LoginAcountView

- (instancetype)init {
    
    
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {

    //手机号
    _img_phone = ({
        UIImageView *phoneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_login_phone"]];
        [self addSubview:phoneImage];
        phoneImage;
    });
    
    _tf_phone = ({
        UITextField *phonetf = [[UITextField alloc]init];
        phonetf.placeholder = @"请输入手机号";
        phonetf.delegate = self;
        phonetf.keyboardType = UIKeyboardTypeNumberPad;
        phonetf.textColor = [UIColor colorWithHexString:TextColor_33];
        phonetf.font = FONT(15);
        [self addSubview:phonetf];
        phonetf;
    });
    
    _line1 = ({
       
        UIView *line1 = [[UIView alloc]init];
        line1.backgroundColor = [UIColor colorWithHexString:KlineColor];
        [self addSubview:line1];
        line1;
    });
    
    
    //验证码
    _img_code = ({
        UIImageView *codeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_login_validate"]];
        [self addSubview:codeImage];
        codeImage;
    });
    
    _tf_code = ({
        UITextField *codetf = [[UITextField alloc]init];
        codetf.delegate = self;
        codetf.placeholder = @"请输入验证码";
        codetf.keyboardType = UIKeyboardTypeNumberPad;
        codetf.textColor = [UIColor colorWithHexString:TextColor_33];
        codetf.font = FONT(15);
        [self addSubview:codetf];
        codetf;
    });
    
    _line2 = ({
        
        UIView *line2 = [[UIView alloc]init];
        line2.backgroundColor = [UIColor colorWithHexString:KlineColor];
        [self addSubview:line2];
        line2;
    });
    
    
    _btn_getCode = ({
        CountDownButton *countDownBtn = [[CountDownButton alloc]init];
        countDownBtn.titleLabel.font = FONT(13);
        [countDownBtn setTitleColor:[UIColor colorWithHexString:TextColor_ff] forState:UIControlStateNormal];
        [countDownBtn setTitleColor:[UIColor colorWithHexString:TextColor_33] forState:UIControlStateSelected];
        [countDownBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        countDownBtn.backgroundColor = [UIColor colorWithHexString:MainBlueColor];
        XBViewBorderRadius(countDownBtn, 15, 0, [UIColor clearColor]);
        [countDownBtn addTarget:self action:@selector(countDownAction)];
        [self addSubview:countDownBtn];
        countDownBtn;
    });
    
    
    
    
}

- (void)countDownAction {
    [self getVecode];
 
    
    
}


- (void)getVecode {
    
    if (![self errorLoginRemind]) {
        NSString *timetempl = [NSString getTimestampByFormatter];
        NSString *signBefore = [NSString stringWithFormat:@"%@%@%@%@", _tf_phone.text, timetempl, terminal_KEY, SEND_VER_CODE_KEY];
        NSString *sign = [NSString MD5:signBefore];
        NSDictionary *params = @{
                                 @"mobilePhone" : _tf_phone.text,
                                 @"type" : terminal_KEY,
                                 @"sign" : sign,
                                 @"time" : timetempl,
                                 };
        
        [HUDHelper showHud];
        [XBNetwork POSTWithURL:k_api_sendVerificationCode parameters:params cachePolicy:0 callback:^(id responseObject, NSError *error) {
            [HUDHelper hideHud];
            int code = [responseObject[@"code"] intValue];
            if (code == 1) {
                [self.btn_getCode setTitleColor:[UIColor colorWithHexString:TextColor_33] forState:UIControlStateNormal];
                [self.btn_getCode countDownFromTime:60 unitTitle:@"s" completion:^(CountDownButton *countDownButton) {
                    [countDownButton setTitle:@"重新获取" forState:UIControlStateNormal];
                }];
            }else if (code == 2) {
                
            }
            
        }];
    }
}



//手机号验证
- (BOOL)errorLoginRemind {
    
    if ([_tf_phone.text isEqualToString:@""]) {
        [HUDHelper showToastWithMessage:@"请先输入您的手机号,再获取验证码"];
        return YES;
    }else if (![NSString checkMobile:_tf_phone.text]) {
       [HUDHelper showToastWithMessage:@"您输入的手机号有误,请重新输入"];
        return YES;
    }
    return NO;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.tf_phone) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.tf_phone.text.length >= 11) {
            self.tf_phone.text = [textField.text substringToIndex:11];
            return NO;
        }
    }
    
    
    if (textField == self.tf_code) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.tf_code.text.length >= 4) {
            self.tf_code.text = [textField.text substringToIndex:4];
            return NO;
        }
    }
    
    return YES;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    //手机号
    [_img_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(32);
        make.left.equalTo(self).offset(20);
        make.width.height.mas_equalTo(18);
        
    }];
    [_tf_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.img_phone.mas_right).offset(13);
        make.centerY.equalTo(self.img_phone);
        make.right.equalTo(self).offset(-13);
        make.height.mas_equalTo(20);
    }];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.img_phone.mas_bottom).offset(14);
        make.right.equalTo(self).offset(-12);
        make.left.equalTo(self).offset(12);
        make.height.mas_equalTo(1.0f);
    }];
    
    
    //验证码
    [_img_code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line1.mas_bottom).offset(42);
        make.left.equalTo(self.img_phone);
        make.width.height.mas_equalTo(18);
    }];
    [_tf_code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.img_code.mas_right).offset(13);
        make.centerY.equalTo(self.img_code);
        make.right.equalTo(self).offset(-100);
        make.height.mas_equalTo(20);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.img_code.mas_bottom).offset(14);
        make.left.right.height.equalTo(self.line1);
    }];

    [_btn_getCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14);
        make.centerY.equalTo(self.img_code.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@86);
    }];
    
    
    
    
}

@end
