//
//  NSAnaCode.h
//  PZJ
//
//  Created by MR.KING on 16/4/29.
//  Copyright © 2016年 EBJ. All rights reserved.
//


#import "SerBackCodeModel.h"

extern NSString * RequestCodeSuccess ;
extern NSString * RequestCodeFail ;
extern NSString * RequestCodeMissParamters ;
extern NSString * RequestCodeNotGetVerCode;
extern NSString * RequestCodeVerCodeExpiredOrWrong ;
extern NSString * RequestCodeUserNotExist ;
extern NSString * RequestCodeLessonHavaApply ;
extern NSString * RequestCodePostFileWrongFormat ;
extern NSString * RequestCodeNoAuthority  ;
extern NSString * RequestCodeActOrPwWrong ;
extern NSString * RequestCodeUserHaveExist ;
extern NSString * RequestCodeLaunageNoCH;
extern NSString * RequestCodeTokenExpired ;
extern NSString * RequestCodeSerKeyDisable ;
extern NSString * RequestCodeFileNotExist ;
extern NSString * RequestCodeSignWrong ;
extern NSString * RequestCodeServerBusy ;
extern NSString * RequestCodePhoneFormatWrong; //手机号格式
extern NSString * RequestCodeEmailFormatWrong ; //email格式
extern NSString * RequestCodeNameForLong ; //姓名过长
extern NSString * RequestCodeEduForLong ; //学历过长
extern NSString * RequestCodeCoNameForLong ; //单位过长
extern NSString * RequestCodeDutiesNameForLong ; //职务过长
extern NSString * RequestCodeTelForLong ; //电话长度过长
extern NSString * RequestCodeProductDown; //产品下线
extern NSString * RequestCodeLessonStopApple;    // 停止招生
extern NSString * RequestCodeLoginOtherDevice;

@interface NSAnaCode : NSObject/********* 通过状态码判断需要提示用户的信息 ************/
/**
 *  it's a object for service's back data
 */
//@property(nonatomic,strong,readonly)SerBackDataModel * serBackData;


/**
 *  the status code model
 */
@property(nonatomic,weak,readonly)SerBackCodeModel * codeModel;

/**
 *  设置需要自动解析的类型
 *
 *  @param type 类型
 *  @param deal 回调
 */
-(void)setAnaForCode:(RequestCodeTypeType)type deal:(void(^)(SerBackCodeModel*code))deal;

/**
 *  解析状态吗模型
 *
 *  @param model 模型
 *
 *  @return 提示的文字
 */
-(NSString*)anaWithCodeModel:(SerBackCodeModel*)model;


/**
 *  解析状态吗模型
 *
 *  @param model 模型
 *
 *  @return 提示的文字
 */
+(NSString*)anaWithCodeModel:(SerBackCodeModel*)model;


/**
 *  解析状态吗模型 并 设置需要自己解析的类型
 *
 *  @param model 模型
 *
 *  @return 提示的文字
 */
+(NSString*)anaWithCodeModel:(SerBackCodeModel*)model anaForCode:(RequestCodeTypeType)type deal:(void(^)(SerBackCodeModel*code))deal;

@end
