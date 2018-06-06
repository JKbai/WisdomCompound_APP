//
//Created by ESJsonFormatForMac on 18/06/03.
//

#import <Foundation/Foundation.h>

@class Repairitemvos,Usecarreasonvo,Uniyvos,Meetingservicevos,Visitreasonvos,Meetingroomreasonvos;
@interface CommonControlModel : NSObject

@property (nonatomic, strong) NSArray<Repairitemvos *> *repairItemVos;

@property (nonatomic, strong) NSArray<Usecarreasonvo *> *useCarReasonVo;

@property (nonatomic, strong) NSArray<Uniyvos *> *uniyVos;

@property (nonatomic, strong) NSArray<Meetingservicevos *> *meetingServiceVos;

@property (nonatomic, strong) NSArray<Visitreasonvos *> *visitReasonVos;

@property (nonatomic, strong) NSArray<Meetingroomreasonvos *> *meetingRoomReasonVos;

@end
@interface Repairitemvos : NSObject

@property (nonatomic, copy) NSString *repairItem;

@property (nonatomic, copy) NSString *repairItemId;

@end

@interface Usecarreasonvo : NSObject

@property (nonatomic, copy) NSString *useCarReasonId;

@property (nonatomic, copy) NSString *useCarReason;

@end

@interface Uniyvos : NSObject

@property (nonatomic, copy) NSString *unitName;

@property (nonatomic, copy) NSString *unitId;

@end

@interface Meetingservicevos : NSObject

@property (nonatomic, copy) NSString *meetingService;

@property (nonatomic, copy) NSString *meetingServiceId;

@end

@interface Visitreasonvos : NSObject

@property (nonatomic, copy) NSString *visitReason;

@property (nonatomic, copy) NSString *visitReasonId;

@end

@interface Meetingroomreasonvos : NSObject

@property (nonatomic, copy) NSString *userMeetingRoomReasonReason;

@property (nonatomic, copy) NSString *useMeetingRoomReasonId;

@end

