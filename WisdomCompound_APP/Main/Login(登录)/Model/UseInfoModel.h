//
//Created by ESJsonFormatForMac on 18/06/04.
//

#import <Foundation/Foundation.h>


@interface UseInfoModel : NSObject
//身份证
@property (nonatomic, copy) NSString *idCard;
//部门id
@property (nonatomic, copy) NSString *deptId;
//部门名称
@property (nonatomic, copy) NSString *deptName;
//姓名
@property (nonatomic, copy) NSString *memberName;

@property (nonatomic, copy) NSString *sectionId;
//会员Id
@property (nonatomic, copy) NSString *memberId;
//手机号
@property (nonatomic, copy) NSString *mobilePhone;
//标识
@property (nonatomic, copy) NSString *token;

@end
