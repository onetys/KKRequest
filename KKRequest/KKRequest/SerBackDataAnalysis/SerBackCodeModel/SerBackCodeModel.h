//
//  SerBackCodeModel.h
//  PZJY
//
//  Created by MR.KING on 16/4/5.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RequestCodeTypeSuccess = 0 <<1,
    RequestCodeTypeFail = 1 <<2 ,
    RequestCodeTypeMissParamters  = 1<<3,
    RequestCodeTypeNotGetVerCode = 1<<4,
    RequestCodeTypeVerCodeExpiredOrWrong  = 1<<5,
    RequestCodeTypeUserNotExist  = 1<<6,
    RequestCodeTypeLessonHavaApply  = 1<<7,
    RequestCodeTypePostFileWrongFormat  = 1<<8,
    RequestCodeTypeNoAuthority   = 1<<9,
    RequestCodeTypeActOrPwWrong  = 1<<10,
    RequestCodeTypeUserHaveExist  = 1<<11,
    RequestCodeTypeLaunageNoCH = 1<<12,
    RequestCodeTypeTokenExpired  = 1<<13,
    RequestCodeTypeSerKeyDisable  = 1<<14,
    RequestCodeTypeFileNotExist = 1 <<15,
    RequestCodeTypeSignWrong = 1 <<16,
    RequestCodeTypeServerBusy  = 1<<17,
    RequestCodeTypePhoneFormatWrong = 1<<18, //手机号格式
    RequestCodeTypeEmailFormatWrong = 1<19 , //email格式
    RequestCodeTypeNameForLong = 1 <<20, //姓名过长
    RequestCodeTypeEduForLong  = 1<<21, //学历过长
    RequestCodeTypeCoNameForLong  = 1<<22, //单位过长
    RequestCodeTypeDutiesNameForLong  = 1<<23, //职务过长
    RequestCodeTypeTelForLong  = 1<<24, //电话长度过长
    RequestCodeTypeProductDown = 1<<25, //产品下线
    RequestCodeTypeLessonStopApple = 1<<26,    // 停止招生
    RequestCodeTypeLoginOtherDevice = 1<<27
} RequestCodeTypeType;

@interface SerBackCodeModel : NSObject/********* 状态码模型 *******/

@property(nonatomic,copy)NSString * rspCode;

@property(nonatomic,copy)NSString * rspMsg;

@property(nonatomic,copy)NSString * showMessage;

@property(nonatomic,assign,readonly)RequestCodeTypeType codeType;

-(BOOL)codeSuccess;

-(RequestCodeTypeType)codeType;

@end
