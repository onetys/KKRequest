//
//  SerBackCodeModel.m
//  PZJY
//
//  Created by MR.KING on 16/4/5.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "SerBackCodeModel.h"

#import "NSAnaCode.h"

@implementation SerBackCodeModel

-(BOOL)codeSuccess{
    return [self.rspCode isEqualToString:RequestCodeSuccess];
}
-(RequestCodeTypeType)codeType{
    if ([self.rspCode isEqualToString:RequestCodeSuccess]) {
        return RequestCodeTypeSuccess;
    }else if ([self.rspCode isEqualToString:RequestCodeFail]){
        return RequestCodeTypeFail;
    }else{
        return RequestCodeTypeTokenExpired;
    }
}

/*
/// 将返回的额状态吗转换成 枚举类型
-(RequestCodeTypeType)codeType{
    if ([self.rspCode isEqualToString:RequestCodeSuccess]) {
        return RequestCodeTypeSuccess;
    }else if ([self.rspCode isEqualToString:RequestCodeFail]){
        return RequestCodeTypeFail;
    }else if ([self.rspCode isEqualToString:RequestCodeMissParamters]){
        return RequestCodeTypeMissParamters;
    }else if ([self.rspCode isEqualToString:RequestCodeNotGetVerCode]){
        return RequestCodeTypeNotGetVerCode;
    }else if ([self.rspCode isEqualToString:RequestCodeVerCodeExpiredOrWrong]){
        return RequestCodeTypeVerCodeExpiredOrWrong;
    }else if ([self.rspCode isEqualToString:RequestCodeUserNotExist]){
        return RequestCodeTypeUserNotExist;
    }else if ([self.rspCode isEqualToString:RequestCodeLessonHavaApply]){
        return RequestCodeTypeLessonHavaApply;
    }else if ([self.rspCode isEqualToString:RequestCodePostFileWrongFormat]){
        return RequestCodeTypePostFileWrongFormat;
    }else if ([self.rspCode isEqualToString:RequestCodeNoAuthority]){
        return RequestCodeTypeNoAuthority;
    }else if ([self.rspCode isEqualToString:RequestCodeActOrPwWrong]){
        return RequestCodeTypeActOrPwWrong;
    }else if ([self.rspCode isEqualToString:RequestCodeUserHaveExist]){
        return RequestCodeTypeUserHaveExist;
    }else if ([self.rspCode isEqualToString:RequestCodeLaunageNoCH]){
        return RequestCodeTypeLaunageNoCH;
    }else if ([self.rspCode isEqualToString:RequestCodeTokenExpired]){
        return RequestCodeTypeTokenExpired;
    }else if ([self.rspCode isEqualToString:RequestCodeSerKeyDisable]){
        return RequestCodeTypeSerKeyDisable;
    }else if ([self.rspCode isEqualToString:RequestCodeFileNotExist]){
        return RequestCodeTypeFileNotExist;
    }else if ([self.rspCode isEqualToString:RequestCodeSignWrong]){
        return RequestCodeTypeSignWrong;
    }else if ([self.rspCode isEqualToString:RequestCodeServerBusy]){
        return RequestCodeTypeServerBusy;
    }else if ([self.rspCode isEqualToString:RequestCodePhoneFormatWrong]){
        return RequestCodeTypePhoneFormatWrong;
    }else if ([self.rspCode isEqualToString:RequestCodeEmailFormatWrong]){
        return RequestCodeTypeEmailFormatWrong;
    }else if ([self.rspCode isEqualToString:RequestCodeNameForLong]){
        return RequestCodeTypeNameForLong;
    }else if ([self.rspCode isEqualToString:RequestCodeEduForLong]){
        return RequestCodeTypeEduForLong;
    }else if ([self.rspCode isEqualToString:RequestCodeCoNameForLong]){
        return RequestCodeTypeCoNameForLong;
    }else if ([self.rspCode isEqualToString:RequestCodeDutiesNameForLong]){
        return RequestCodeTypeDutiesNameForLong;
    }else if ([self.rspCode isEqualToString:RequestCodeTelForLong]){
        return RequestCodeTypeTelForLong;
    }else if ([self.rspCode isEqualToString:RequestCodeProductDown]){
        return RequestCodeTypeProductDown;
    }else if ([self.rspCode isEqualToString:RequestCodeLessonStopApple]){
        return RequestCodeTypeLessonStopApple;
    }else if ([self.rspCode isEqualToString:RequestCodeLoginOtherDevice]){
        return RequestCodeTypeLoginOtherDevice;
    }else{
        return RequestCodeTypeServerBusy;
    }
    
}
 */

@end
