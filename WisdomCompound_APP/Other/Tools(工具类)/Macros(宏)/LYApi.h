//
//  LYApi.h
//  LogisticsYard
//
//  Created by 白印潇 on 2018/5/20.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#ifndef LYApi_h
#define LYApi_h

#pragma mark -  * * * * * * * * * * * * * * 域名切换 * * * * * * * * * * * * * *
/**
 *  域名
 *
 *  @param 开发环境
 *
 */
//#define BaseURL @"http://10.7.17.104:8080/logistics-mapi/"

/**
 *  域名
 *
 *  @param 测试环境
 *
 */
//#define BaseURL @"http://47.105.32.6:8780/logistics-mapi/"


/**
 *  域名
 *
 *  @param 正式环境
 *
 */
//#define BaseURL @"http://47.105.32.6:8780/logistics-mapi/"


/**
 *  域名
 *
 *  @param 接口联调相关人员
 *
 */

//#define BaseURL @"http://10.7.17.104:8080/logistics-mapi//" //马超
#define BaseURL @"http://192.168.1.102:8080/logistics-mapi/" //卢凯歌本地
//#define BaseURL @"http://10.7.17.104:8080/logistics-mapi//" //卢凯歌花生壳




#pragma mark -  * * * * * * * * * * * * * * 请求路径 * * * * * * * * * * * * * *

#pragma mark ===================  公共接口  ==================

//上传图片
#define k_api_uploadFileNew @"app/upload/uploadFileNew.do"

//公共配置数据
#define k_api_commonControl @"app/common/commonControl.do"


#pragma mark ===================  主功能区  ==================
/*  首页 */
//获取活动列表
#define k_api_advertList @"app/advert/advertList.do"

//获取系统公告信息
#define k_api_noticeList @"app/advert/noticeList.do"

//是否有未读消息
#define k_api_isRead @"app/advert/isRead.do"


//访客预约
#define k_api_visitorApplication @"app/visitor/visitorApplication.do"

//报修申请
#define k_api_repairApplication @"app/repair/repairApplication.do"

//用车申请查看的车辆列表
#define k_api_carApplicationList @"app/car/carApplicationList.do"

//申请车辆
#define k_api_carApplication @"app/car/carApplication.do"

//会议室预约
#define k_api_meetingApplication @"app/meeting/meetingApplication.do"

//智慧餐厅
#define k_api_dailyMenuList @"app/dailyMenu/dailyMenuList.do"

//智慧餐厅详情
#define k_api_dailyMenuDetail @"app/dailyMenu/dailyMenuDetail.do"

//新闻资讯
#define k_api_newList @"app/advert/newList.do"


#pragma mark ===================  个人中心  ==================
//我要反馈
#define k_api_customerFeedbackAdd @"app/customerFeedback/customerFeedbackAdd.do"

//我的消息
#define k_api_myNews @"app/advert/myNews.do"

//个人资料
#define k_api_memberCenter @"app/member/memberCenter.do"

//修改昵称
#define k_api_updateNickname @"app/member/updateNickname.do"

//修改头像
#define k_api_uploadHeadPhoto @"app/member/uploadHeadPhoto.do"


/*  访客记录 */
//访客列表
#define k_api_visitorList @"app/visitor/visitorList.do"

//访客详情
#define k_api_visitorDetail @"app/visitor/visitorDetail.do"


/*  报修记录 */
//报修反馈申请列表
#define k_api_repoirList @"app/repair/repairList.do"

//报修反馈申请详情
#define k_api_repoirDetail @"app/repair/repairDetail.do"

//报修反馈评价
#define k_api_repoirComment @"app/repair/repairComment.do"


/*  用车记录 */
//车辆申请列表
#define k_api_carRecordList @"app/car/carRecordList.do"

//用车申请详情
#define k_api_uploadHeadPhoto @"app/car/carDetail.do"


/*  会议记录 */
//会议申请列表
#define k_api_meetingList @"app/meeting/meetingList.do"

//会议申请详情
#define k_api_meetingDetail @"app/meeting/meetingDetail.do"

//会议室评价
#define k_api_meetingComment @"app/meeting/meetingComment.do"

//取消会议
#define k_api_cancellationMeeting @"app/meeting/cancellationMeeting.do"



#pragma mark ===================  登录启动  ==================

//获取验证码接口
#define k_api_sendVerificationCode  @"app/member/sendVerificationCode.do"
//登录
#define k_api_login @"app/member/login.do"


#endif /* LYApi_h */
